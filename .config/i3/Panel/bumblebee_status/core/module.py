import os
import importlib
import logging
import threading

import core.config
import core.input
import core.widget
import core.decorators

import util.format

try:
    error = ModuleNotFoundError("")
except Exception as e:
    ModuleNotFoundError = Exception

log = logging.getLogger(__name__)


"""Loads a module by name

:param module_name: Name of the module to load
:param config: Configuration to apply to the module (defaults to an empty configuration)
:param theme: Theme for this module, defaults to None, which means whatever is configured in "config"

:return: A module object representing the module, or an Error module if loading failed
:rtype: class bumblebee_status.module.Module
"""


def load(module_name, config=core.config.Config([]), theme=None):
    error = None
    module_short, alias = (module_name.split(":") + [module_name])[0:2]
    config.set("__alias__", alias)
    for namespace in ["core", "contrib"]:
        try:
            mod = importlib.import_module(
                "modules.{}.{}".format(namespace, module_short)
            )
            log.debug(
                "importing {} from {}.{}".format(module_short, namespace, module_short)
            )
            return getattr(mod, "Module")(config, theme)
        except ImportError as e:
            log.debug("failed to import {}: {}".format(module_name, e))
            error = e
    log.fatal("failed to import {}: {}".format(module_name, error))
    return Error(config=config, module=module_name, error=error)


class Module(core.input.Object):
    """Represents a module (single piece of functionality) of the bar

    :param config: Configuration to apply to the module (defaults to an empty configuration)
    :param theme: Theme for this module, defaults to None, which means whatever is configured in "config"
    :param widgets: A list of bumblebee_status.widget.Widget objects that the module is comprised of
    """

    def __init__(self, config=core.config.Config([]), theme=None, widgets=[]):
        super().__init__()
        self.background = False
        self.__thread = None
        self.__config = config
        self.__widgets = widgets if isinstance(widgets, list) else [widgets]

        self.module_name = self.__module__.split(".")[-1]
        self.name = self.module_name
        self.alias = self.__config.get("__alias__", None)
        self.id = self.alias if self.alias else self.name
        self.next_update = None

        self.theme = theme

        for widget in self.__widgets:
            widget.module = self

    """Override this to determine when to show this module

    :return: True if the module should be hidden, False otherwise
    :rtype: boolean
    """

    def hidden(self):
        return False

    """Retrieve CLI/configuration parameters for this module. For example, if
    the module is called "test" and the user specifies "-p test.x=123" on the
    commandline, using self.parameter("x") retrieves the value 123.

    :param key: Name of the parameter to retrieve
    :param default: Default value, if parameter is not set by user (defaults to None)

    :return: Parameter value, or default
    :rtype: string
    """

    def parameter(self, key, default=None):
        value = default

        for prefix in [self.name, self.module_name, self.alias]:
            value = self.__config.get("{}.{}".format(prefix, key), value)
        return value

    """Set a parameter for this module

    :param key: Name of the parameter to set
    :param value: New value of the parameter
    """

    def set(self, key, value):
        self.__config.set("{}.{}".format(self.name, key), value)

    """Override this method to define tasks that should be done during each
    update interval (for instance, querying an API, calling a CLI tool to get new
    date, etc.
    """

    def update(self):
        pass



    def update_wrapper(self):
        if self.background == True:
            if self.__thread and self.__thread.isAlive():
                return # skip this update interval
            self.__thread = threading.Thread(target=self.internal_update, args=(True,))
            self.__thread.start()
        else:
            self.internal_update(False)


    """Wrapper method that ensures that all exceptions thrown by the
    update() method are caught and displayed in a bumblebee_status.module.Error
    module
    """

    def internal_update(self, trigger_redraw=False):
        try:
            self.update()
            if trigger_redraw:
                core.event.trigger("update", [self.id], redraw_only=True)
        except Exception as e:
            self.set("interval", 1)
            module = Error(config=self.__config, module="error", error=str(e))
            self.__widgets = [module.widget()]
            self.update = module.update

    """Retrieves the list of widgets for this module

    :return: A list of widgets
    :rtype: list of bumblebee_status.widget.Widgets
    """

    def widgets(self):
        return self.__widgets

    """Removes all widgets of this module"""

    def clear_widgets(self):
        del self.__widgets[:]

    """Adds a widget to the module

    :param full_text: Text or callable (method) that defines the text of the widget (defaults to "")
    :param name: Name of the widget, defaults to None, which means autogenerate

    :return: The new widget
    :rtype: bumblebee_status.widget.Widget
    """

    def add_widget(self, full_text="", name=None):
        widget = core.widget.Widget(full_text=full_text, name=name)
        self.widgets().append(widget)
        widget.module = self
        return widget

    """Convenience method to retrieve a named widget

    :param name: Name of widget to retrieve, defaults to None (in which case the first widget is returned)

    :return: The widget with the corresponding name, None if not found
    :rtype: bumblebee_status.widget.Widget
    """

    def widget(self, name=None):
        if not name:
            return self.widgets()[0]

        for w in self.widgets():
            if w.name == name:
                return w
        return None

    """Override this method to define states for the module

    :param widget: Widget for which state should be returned

    :return: a list of states for this widget
    :rtype: list of strings
    """

    def state(self, widget):
        return []

    """Convenience method that sets warning and critical state for numbers

    :param value: Current value to calculate state against
    :param warn: Warning threshold
    :parm crit: Critical threshold

    :return: None if value is below both thresholds, "critical", "warning" as appropriate otherwise
    :rtype: string
    """

    def threshold_state(self, value, warn, crit):
        if value > float(self.parameter("critical", crit)):
            return "critical"
        if value > float(self.parameter("warning", warn)):
            return "warning"
        return None

    def register_callbacks(self):
        actions = [
            {"name": "left-click", "id": core.input.LEFT_MOUSE},
            {"name": "right-click", "id": core.input.RIGHT_MOUSE},
            {"name": "middle-click", "id": core.input.MIDDLE_MOUSE},
            {"name": "wheel-up", "id": core.input.WHEEL_UP},
            {"name": "wheel-down", "id": core.input.WHEEL_DOWN},
        ]
        for action in actions:
            if self.parameter(action["name"]):
                core.input.register(
                    self,
                    action["id"],
                    self.parameter(action["name"]),
                    util.format.asbool(
                        self.parameter("{}-wait".format(action["name"]), False)
                    ),
                )


class Error(Module):
    """Represents an "error" module

    :param module: The module name that produced the error
    :param error: The error message to display
    :param config: Configuration to apply to the module (defaults to an empty configuration)
    :param theme: Theme for this module, defaults to None, which means whatever is configured in "config"
    """

    def __init__(self, module, error, config=core.config.Config([]), theme=None):
        super().__init__(config, theme, core.widget.Widget(self.full_text))
        self.__module = module
        self.__error = error

    """Returns the error message
    :param widget: the error widget to display
    """

    def full_text(self, widget):
        return "{}: {}".format(self.__module, self.__error)

    """Overriden state, always returns critical (it *is* an error, after all"""

    def state(self, widget):
        return ["critical"]


# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
