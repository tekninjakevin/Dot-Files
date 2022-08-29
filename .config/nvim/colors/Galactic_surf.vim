
" Vim colorscheme file
" Maintainer:   Kevin Tagreen <spidermankevin78@gmail.com>
" Last Change:  2030-08-1
" URL:
" MAIN URL:
"
" This is my custom syntax file to override the defaults provided with Vim.
"This file should be located in $HOME/vimfiles/colors.

set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "Galactic_surf"

"Colors
let Lightpurple = "#5fff5f"
let Neonpink = "#ff005e"
let Orange = "#ff5e00"
let Neonblue = "#00d7d7"
let LightPurple = "#F3F315"
let Dark = "#192224"
let Purple = "#BD9800"
let Lightgrey = "#A1A6A8"
let Strangeblue = "#536991"
let White = "#F9F9FF"
let Darkgrey = "#4e4e4e"
let Lightblack = "#262626"
let Red = "#FF00DD"
let Purple = "#57007C"
let red = "#660066"
let LightPurple = "#B988ED"
let DarkestBlue = "#2211F1"
"
"-------------Normal Text
highlight Normal ctermbg=NONE ctermfg=Magenta  guifg=Purple
highlight Curser guibg=Gray70 guifg=White
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=black
highlight NonText                 guibg=Grey80
highlight Label guifg=Purple guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold

highlight StatusLine     gui=bold guibg=Purple   guifg=White
highlight StatusLineNC            guibg=Purple    guifg=White
"------------Number Bar
highlight LineNr term=none cterm=none ctermfg=White ctermbg=129
highlight CursorLineNr ctermbg=White ctermfg=DarkBlue

"---Colorscheme for folds
highlight Folded cterm=bold ctermfg=blue ctermbg=93
highlight FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none

"---Other
highlight Comment term=bold ctermfg=165 guifg=DarkestBlue
highlight SpecialComment ctermfg=NONE ctermbg=NONE guifg=Purple guibg=Purple
highlight Constant term=underline ctermfg=White guifg=White
highlight Number term=underline ctermfg=NONE guifg=Strangeblue
highlight Identifier term=underline ctermfg=DarkMagenta guifg=Purple
highlight Statement term=bold ctermfg=32 gui=bold guifg=Strangeblue
highlight PreProc    term=underline ctermfg=Blue    guifg=#ff00db
highlight Type       term=underline ctermfg=Lightblue  gui=bold  guifg=#FF00BD
highlight Special term=bold ctermfg=lightMagenta guifg=Orange
highlight Ignore	ctermfg=White guifg=White
highlight Error		ctermfg=Red ctermbg=Yellow guifg=red guibg=Yellow
highlight Todo   guifg=Neonblue  guibg=White

" Change the highlight of search matches (for use with :set hls).
highlight Search                    ctermfg=Black      ctermbg=White  guifg=Black    guibg=Yellow

" Change the highlight of visual highlight.
highlight Visual      cterm=NONE    ctermfg=Black      ctermbg=Blue  gui=NONE    guifg=Black guibg=Grey70

highlight Float                     ctermfg=Blue                       guifg=#88AAEE
highlight Exception                 ctermfg=Red        ctermbg=White   guifg=Red      guibg=White
highlight Typedef                   ctermfg=White      ctermbg=Blue    gui=bold       guifg=White guibg=Blue
highlight SpecialChar               ctermfg=Black      ctermbg=White   guifg=Black    guibg=White
highlight Delimiter                 ctermfg=White      ctermbg=Black   guifg=White    guibg=Black
highlight WildMenu guifg=NONE guibg=Lightgrey guisp=Lightgrey gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
highlight SignColumn guifg=Dark guibg=Strangeblue guisp=Strangeblue gui=NONE ctermfg=235 ctermbg=60 cterm=NONE

highlight Character guifg=Lightgrey guibg=NONE guisp=NONE gui=NONE ctermfg=165 ctermbg=NONE cterm=NONE
highlight TabLineSel guifg=Dark guibg=Neonblue guisp=Neonblue gui=bold ctermfg=235 ctermbg=44 cterm=bold
highlight Number guifg=DarkestBlue guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
highlight Boolean guifg=Purple guibg=NONE guisp=NONE gui=NONE ctermfg=191 ctermbg=NONE cterm=NONE
highlight Operator guifg=Orange guibg=NONE guisp=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold

highlight SpellLocal guifg=White guibg=Dark guisp=Dark gui=underline ctermfg=189 ctermbg=235 cterm=underline
highlight Error guifg=Purple guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
highlight PMenu guifg=Dark guibg=Darkgrey guisp=Darkgrey gui=NONE ctermfg=235 ctermbg=239 cterm=NONE
highlight SpecialKey guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
highlight Constant guifg=Lightgrey guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
highlight Tag guifg=Purple guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
highlight String guifg=Lightpurple guibg=NONE guisp=NONE gui=NONE ctermfg=83 ctermbg=NONE cterm=NONE
highlight PMenuThumb guifg=NONE guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
highlight MatchParen guifg=Purple guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
highlight Repeat guifg=Neonpink guibg=NONE guisp=NONE gui=bold ctermfg=197 ctermbg=NONE cterm=bold
highlight SpellBad guifg=White guibg=Dark guisp=Dark gui=underline ctermfg=119 ctermbg=235 cterm=underline
highlight Directory guifg=Strangeblue guibg=NONE guisp=NONE gui=bold ctermfg=165 ctermbg=NONE cterm=bold
highlight Structure guifg=Strangeblue guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
highlight Macro guifg=Purple guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
highlight Underlined guifg=White guibg=Dark guisp=Dark gui=underline ctermfg=189 ctermbg=235 cterm=underline
highlight DiffAdd guifg=NONE guibg=#193224 guisp=#193224 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
highlight TabLine guifg=Dark guibg=Darkgrey guisp=Darkgrey gui=bold ctermfg=235 ctermbg=239 cterm=bold
highlight pythonimport guifg=Neonblue guibg=NONE guisp=NONE gui=bold ctermfg=44 ctermbg=NONE cterm=bold
highlight pythonbuiltin guifg=LightPurple guibg=NONE guisp=NONE gui=bold ctermfg=140 ctermbg=NONE cterm=bold
highlight pythoninclude guifg=Neonblue guibg=NONE guisp=NONE gui=bold ctermfg=164 ctermbg=NONE cterm=bold
highlight vimbracket guifg=Orange guibg=NONE guisp=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold
highlight cursorim guifg=Dark guibg=Strangeblue guisp=Strangeblue gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
highlight pythonbuiltinfunc guifg=LightPurple guibg=NONE guisp=NONE gui=bold ctermfg=11 ctermbg=NONE cterm=bold
highlight pythonbuiltinobj guifg=LightPurple guibg=NONE guisp=NONE gui=bold ctermfg=11 ctermbg=NONE cterm=bold
highlight vimFunction guifg=Orange guibg=NONE guisp=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold
highlight vimNotation guifg=Orange guibg=NONE guisp=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold
highlight vimAutoEvent guifg=Orange guibg=NONE guisp=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold
highlight vimMapModKey guifg=Orange guibg=NONE guisp=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold
highlight vimParenSep guifg=Orange guibg=NONE guisp=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold
highlight makeStatement guifg=Orange guibg=NONE guisp=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold
