"################################################################
"#┌─────────────────────────────────────────────────────────────┐#
"#│ ______        __      __  __                                │#
"#│/\__  _\      /\ \    /\ \/\ \  __            __             │#
"#│\/_/\ \/    __\ \ \/'\\ \ `\\ \/\_\    ___   /\_\     __     │#
"#│   \ \ \  /'__`\ \ , < \ \ , ` \/\ \ /' _ `\ \/\ \  /'__`\   │#
"#│    \ \ \/\  __/\ \ \\`\\ \ \`\ \ \ \/\ \/\ \ \ \ \/\ \L\.\_ │#
"#│     \ \_\ \____\\ \_\ \_\ \_\ \_\ \_\ \_\ \_\_\ \ \ \__/.\_\│#
"#│      \/_/\/____/ \/_/\/_/\/_/\/_/\/_/\/_/\/_/\ \_\ \/__/\/_/│#
"#│                                             \ \____/        │#
"#│                                              \/___/         │#
"#└─────────────────────────────────────────────────────────────┘#
"#################################################################
"#           .-.   .-.,-.        .,-..-. .-.,-. _______          #
"#            \ \ / / |(||\    /| |(||  \| ||(||__   __|         #
"#             \ V /  (_)|(\  / | (_)|   | |(_)  )| |            #
"#              ) /   | |(_)\/  | | || |\  || | (_) |            #
"#             (_)    | || \  / | | || | |)|| |   | |            #
"#                    `-'| |\/| | `-'/(  (_)`-'   `-'            #
"#                       '-'  '-'   (__)                         #
"# Author - TekNinja-Kevin Tangereen Spidermankevin78@gmail.com  #
"# Last Update June 21st 2018                                    #
"# License - © 2018- http://www.wtfpl.net/                       #
"#################################################################
"==============Plugins============================================{{{
"Plugin=AutoSave
"Plugin=Acp 			Auto Complete Popup
"Plugin=Airline			Status line plug in
"Plugin=Auto-Pairs		Atomantacly Pare brackets and tags
"Plugin=BufExplore		Exlpore Buffers
"Plugon=Deoplete		Completions for NeoVim
"Plugin=Calendar		Calander
"Plugin=Cecutil
"Plugin=Closetag		<close></tag>
"Plugin=CtrlP			A finding tool
"Plugin=Grammarous
"Plugin=Gundo
"Plugin=gzip			Read text files in gzip files
"Plugin=Matchparen 		shows matching ""
"Plugin=mru			Must Recently used
"Plugin=Preview			Preview Markup files
"Plugin=notes			Markdown style notes
"Plugin=Syntastics		Syntax Syntax Checking
"Plugin=omnicomplete		Syntacs Completions
"Plugin-Wintagexplore		Tag Explore
"Plugin=Nerdtree		Side pane file manger
"=================================================================}}}
"==============General ==========================================={{{
    set shell=$SHELL        " use current shell for shell commands
"---Tab Settings
   set autoindent  
    set smartindent
    set smarttab
    set tabstop=4
    set shiftwidth=4
    set expandtab
"---Numbering
    set number
    set numberwidth=5
"---Just like a word processor
    set listchars=tab:>>,trail:*,extends:>,eol:¬,nbsp:_
    set list
"---Settings for Completionsi
   "set mps+=<<<:>>>
   "set mps+=<:>

    set omnifunc=syntanxcomplete
    set completeopt= "menu,longest,Preview"
    set complete = ".,w,b,k,kspell,t"
"---oragomi
  set foldenable                    " Turn Folding on
  set foldmethod=marker
"---Search Settings
  set ignorecase
  set smartcase
  set hlsearch
"-- keep search matches in the middle of the window.
  nnoremap n nzzzv
  nnoremap N Nzzzv
"---Other Settings
  set showmatch                     "Show Matching Brackets
  set history=2500                  "Long Hisoory"
  set clipboard+=unnamedplus        "Use X's ClipBoard"
  set wildmenu                      "command-line Completions our enhanced
  set hidden			"Makes vim hide buffers"	
  set showcmd                       "Show last command used"
  set noswapfile                    "We Don't need no sticking swap"
  set backspace=indent,eol,start    "use my fave keys"
  set laststatus=2                  "Status line Always on "
  set confirm                       "I need be shure"
  set noshowmode                    "Airline handles dis Shit"
  set magic                         "Use Magic "
  set autoread                      "read its"
"  set autowrite
  set backup                        "keep a back up"
  set mps+=<:>                      "more exoctic"  i
  set cursorline
"--autosave Settings Save ever time i exit insert
  let g:auto_save = 1
    set mouse=a


" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
"================================================================}}}
"==============Key Bindings======================================{{{

"--- Reload Vimrc
    noremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"---fuck you vim lol
    command! Q q " Bind :Q to :q
    command! Qall qall
    command! W w
    command! E e

"---Home
    nmap <Home> gg
    nmap <End> $
    imap <Home> ^
    imap <end> $

    map <Leader>w :w<CR>
"-----------------------------------------------"
"---Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>
" Close all the buffers
map <leader>ba :bufdo bd<cr>
"---Move to previus and next tab
    map <leader>l :tabn<cr>
    map <leader>h :tabp<cr>
"-----------------------------------------------""
"---Open with locate or find command
    map <leader>ro :exec '!rifle' . shellescape(getline('.')) <CR><CR>
"---Clean trailing whitespace
    nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<cr>`z
"---copy or paste from X11 clipboard
    vmap <leader>xyy :!xclip -f -sel clip<CR>
    map <leader>xpp mz:-1r !xclip -o -sel clip<CR>`z
"---No need to press shift
    nmap ; :
"---Vintage Computer Style way of Exiting insert mode.
    imap <C-c> <esc>
"---Better y to Get to the end or start of line
    nmap H ^
    nmap L $
    vmap H ^
    vmap L $

"--- Ctrl-E to jump to end of line in Insert Mode
    inoremap <c-e> <c-o>$
"--- Ctrl-A to jump to start of line in Insert Mode
    inoremap <c-a> <c-o>^
"---Use logial lines in normanl mode
    nnoremap j gk
    nnoremap k gk
"---Create new tab
    map <C-t> :tabnew<cr>
"---Move around windows with out hitting c-w first
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l
"---Buffer selection
    nnoremap <leader>n :bn<CR>
    nnoremap <leader>p :bp<CR>
"---fix Spelling Errors in normal mode
    nnoremap <leader>sp :call FixLastSpellingError()<cr>
"---Nerd tree
    map <leader>nn :NERDTree<CR>
"---buffer list
    map <leader>b :BufExplore<CR>
"---spelling

"---FZF
    map <leader>f :fzf<CR>
    map <leader>s :setlocal spell! spelllang=en_us
"---file list
    nmap <leader>e :Explore<CR>
"----most Recent Documents
    nmap <leader>m :MRU<CR>
"---Words rocessor Mode
    nmap <leader>wp :WP<cr>
"---Load the current buffer in  uzbl
    nmap ,c :!open -a vimb<cr>
"---refocus folds; close any other fold except the one that you are one
    nnoremap ,z zMzvzz
"---Yank entire buffer with gy
    nnoremap gy :0,$ y<cr>
"---Select entire buffer
    nnoremap vy ggVG
"---Create newlines without entering insert mode
    nnoremap go o<Esc>k

    nnoremap gO O<Esc>j

    nmap <Enter> o<Esc>
"---Navigating with guides
    inoremap <Space><Tab> <Esc>/<Enter>"_c4l
    vnoremap <Space><Tab> <Esc>/<Enter>"_c4l
    map <Space><Tab> <Esc>/<Enter>"_c4l
    map <leader>c :!compiler <c-r>%<CR>
    "Change case
    vmap <C-u> <esc>mzgUiw`za
"---Split Vertical
	nmap <leader>v <C-w>v
	nmap <leader>H <c-w>s
"----Undo tree"
"nmap <leader>g :GundoToggle<CR>
" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Faster :ex commands
    nnoremap <C-s> :write<CR>
    inoremap <C-s> <ESC>:write<CR>
    nnoremap <C-q> :close<CR>

"----Startify
"
noremap <leader>st :Startify<cr>

" Text alignment
nnoremap <Leader>Al :left<CR>
nnoremap <Leader>Ac :center<CR>
nnoremap <Leader>Ar :right<CR>
vnoremap <Leader>Al :left<CR>
vnoremap <Leader>Ac :center<CR>
vnoremap <Leader>Ar :right<CR>
"------Fuction Keys Mapping-----"
" help Key
 	map <F1> :help

" Show/Hide Marker Charcters:
inoremap <silent> <F2> :set invlist<CR>
" toggle number lines
inoremap <F3> :set nonumber! nonumber?<CR>
" toggle search highlights
    inoremap <F4> :set hlsearch! hlsearch?<CR>
    nmap <F5> :WP
    inoremap <F6> :setlocal spell! spelllang=en_us,es<CR>
" fold close
map <F7> :w<CR>
map <F8> :AuoSaveToggle<CR>
map <F9> :Calendar<CR>
map <F10> :Note<CR>

"================================================================}}}
"==============Vim Paths========================================={{{
set backup                              " Make Backup
set backupdir=$HOME/.vim_backup    " but not when they clog .
set directory=$HOME/.vimswap           "  Same for swap files
set undofile                            " Make undofile
set undodir=~/.vim_undo              " undofile location
"================================================================}}}
"==============Themes and colorschemers=========================={{{
"-Settings-------------------------------------------------
  filetype indent plugin on
  syntax on
  set hlsearch
"---Theme
  colorscheme Galactic_surf      "First Choice
"colorscheme delek
"colorscheme archery
"colorscheme delek
"------------------------------------------------
"---Tweaks Need to move to theme once I fork NeonBrainFuck into TotalyFucked
"---I Gots to have my Tarans parent Background
  hi Search cterm=NONE ctermfg=NONE ctermbg=blue
  hi IncSearch cterm=NONE ctermfg=NONE ctermbg=blue
  hi Normal ctermbg=NONE
  hi nonText ctermbg=NONE
  hi CursorLine cterm=NONE ctermfg=NONE ctermbg=black
"---Line number bar with Blue background white text
  highlight LineNr term=none cterm=none ctermfg=White ctermbg=DarkBlue
  highlight CursorLineNr ctermbg=White ctermfg=DarkBlue
"---Colorscheme for folds
  hi Folded cterm=bold ctermfg=black ctermbg=Blue
  hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none
"-----------------StatusBar &  TabBar Tweeks
"---Theme
let g:airline_theme='soda'
"---Powerline gliphs
  let g:airline_powerline_fonts = 1
"---Show PASTE if in paste mode
  let g:airline_detect_paste=1
let g:airline_detect_spelllang=0

  let g:airline_section_error = '%-0.30{getcwd()}'
  let g:airline_inactive_collapse=0
"---Show airline for tabs too
  let g:airline#extensions#tabline#enabled = 1
"---enable/disable displiaying buffers with a single tab. (c) >
  let g:airline#extensions#tabline#show_buffers = 1
"---defines the name of a formatter for how buffer names are displayed. (c) >
  let g:airline#extensions#tabline#formatter = 'default'
"---enable/disable displaying tab number in tabs mode. >
  let g:airline#extensions#tabline#show_tab_nr = 0

"==============================================================}}}
"==============Presistand Undo================================={{{
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry
"=============================================================}}}
"==============Fuctions======================================={{{
"Vim Word processing mode
func! WordProcessorMode()
	setlocal textwidth=80
	setlocal smartindent
	setlocal spell spelllang=en
	setlocal noexpandtab
g:grammarous#use_vim_spelllang`. Default 0, to enable
endfu

com! WP call WordProcessorMode()

function! FixLastSpellingError()
  normal! mm[s1z=`m
endfunction

" Ranger File Browser in Vim
" http://www.everythingcli.org/use-ranger-as-a-file-explorer-in-vim/
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

        map <Leader>f :call AutoFormat()<cr>

        let g:autoformat_on_save_default = 0

        if !exists('g:autoformat_on_save')
            let g:autoformat_on_save = g:autoformat_on_save_default
        endif

        autocmd! BufWritePre * if g:autoformat_on_save | call AutoFormat() | endif
" [c]lear [w]hitespace
function! ClearWhitespace()
    let winview = winsaveview()
    let _s=@/
    execute 'keepjumps %s/\s\+$//e'
    let @/=_s
    nohl
    update
    call winrestview(winview)
endfunction
nnoremap <Leader>cw :call ClearWhitespace()<CR>
inoremap <Leader>m <C-R>=ListMonths()<CR>


	func! ListMonths()
	  call complete(col('.'), ['January', 'February', 'March',
		\ 'April', 'May', 'June', 'July', 'August', 'September',
		\ 'October', 'November', 'December'])
	  return ''
	endfunc

"================================================================}}}
"==============Synastics Seting=================================={{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler_options = " -std=c++11"
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_coffeescript_checkers = ["coffeelint"]
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_css_checkers = ["csslint", "prettycss"]
let g:syntastic_python_checkers = ["flake8", "python"]
let g:syntastic_html_checkers = ['html_tidy']
let g:livepreview_previewer = 'evince'
let g:html_indent_inctags = "html,body,head,tbody"
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" Syntastics
let g:systastic_python_cherkers = ['python','py3kwam']

" Javascript
let g:syntastic_javascript_checkers = ['jshint']


"================================================================}}}
"==============Abreviations======================================{{{
" Time
"
	    iab _datetime <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
  iab _time <C-R>=strftime("%H:%M")<CR>
  iab _date <C-R>=strftime("%c")<CR>
" 
" ersonal
  iab _name Kevin Dale Tangreen
  iab _mail1 Spidermankevin78@gmail.com
  iab _mail2 kevinross@linuxmail.org
  iab _maillink <a href="spidermankevin7@gmail.com>spidermankevin7@gmail.com</a>
  iab _addr 510 McEvoy Street Apt 5 Mauston Wisconsin 53948
  iab _if if !cursor! then <+++> <cr><cr> End if <esc> :call search('!curser!','b')<cr>cf!:
  
  iab _null  >/dev/null 2>&1 &
  
"Html
    iab _h1 <h1 id="!curser!"><+++></h1><esc> :call search('!curser!','b')<cr>cf!
    iab _h2 <h2 id="!curser!"><+++></h1><esc> :call search('!curser!','b')<cr>cf!
    iab _h3 <h3 id="!curser!"><+++></h1><esc> :call search('!curser!','b')<cr>cf!
    iab _h4 <h4 id="!curser!"><+++></h1><esc> :call search('!curser!','b')<cr>cf!
    iab _h5 <h5 id="!curser!"><+++></h1><esc> :call search('!curser!','b')<cr>cf!
    iab _input <input type="!curser!" name="<+++>" value="<+++>" id="<+++>" /><+++> :call search('!curser!','b')<cr>cf!
    iab _p <p>!curser!</p>
    iab _ref <a href="!curser!"></a><esc> :call search('!curser!','b')<cr>cf!
    iab _img <img src="!curser!" /></a><esc> :call search('!curser!','b')<cr>cf!
    iab _table <table class="!cruser!"><cr><tr><cr><td>!curser!</td><cr></tr><cr></table>  :call search('!curser!','b')<cr>cf!
    iab _Center <center> <cr> !curser! <cr><esc> :call search('!curser!','b')<cr>cf!: 
"=================================================================}}}
"==============AutoCommands======================================={{{
"set all filetypes textwidth to
    autocmd FileType text setlocal textwidth=80
" reopen file where you left off
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
"---Make calcurse notes markdown compatible:
    autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
    autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
"---omnifunc settings for deffernt file types
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
"---Python
    let python_highlight_all = 1
    autocmd FileType python syn keyword pythonDecorator True None False self
"---JavaScript
    autocmd FileType javascript call JavaScriptFold()
    autocmd FileType javascript setl fen
    autocmd FileType javascript setl nocindent
"---X11-Basic
    autocmd BufNewFile,BufRead *.bas set filetype=Basic
    autocmd BufNewFile,BufRead *.BAS set filetype=Basic
    autocmd BufNewFile,BufRead *.bas set syntax=Basic
    autocmd BufNewFile,BufRead *.css set filetype=css
    autocmd BufRead,BufNewFile *.vim set filetype=vim
    autocmd BufRead,BufNewFile ~/.zshrc set filetype=zsh
    autocmd bufRead,BufNewFile *.sh set filetype=zsh

    autocmd BufRead,BufNewFile *.html set filetype=html
    autocmd BufRead,BufNewFile .remind set filetype=remind
    autocmd BufRead,BufNewFile *.bas set filetype=basic
    autocmd BufRead,BufNewFile .reminders set filetype=remind
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd BufRead,BufNewFile *.conf set filetype=conf
    autocmd BufRead,BufNewFile *rc set filetype=config
    autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
    autocmd BufNewFile,BufRead *.mako set ft=mako
    autocmd BufNewFile,BufRead *.md set filetype=markdown
    autocmd BufNewFile,BufRead *.mk set filetype=make
    autocmd BufNewFile,BufRead *.c set filetype=c
    autocmd BufNewFile,BufRead .conyrc* set filetype=conkyrc
    autocmd BufNewFile,BufRead ~/i3/config set filetype=i3
    autocmd BufNewFile,BufRead *.py set filetype=python
    autocmd BufNewFile,BufRead .remind set filetype=remind
    autocmd BufRead,BufNewFile .c set filetype=c
    autocmd BufNewFile,BufRead .go set filetype=go
    autocmd BufNewFile,BufRead .pl set filetype=perl
    autocmd BufNewFile,BufRead .muttrc set filetype=muttrc
    autocmd BufNewFile,BufRead .neomuttrc set filetype=neomuttrc
    autocmd BufNewFile,BufRead muttrc set filetype=muttrc
    autocmd BufNewFile,BufRead neomuttrc set filetype=neomuttrc
    autocmd BufNewFile,BufRead .taskrc set filetype=taskrc
    autocmd BufNewFile,BufRead .vim set filetype=vim
    autocmd BufNewFile,BufRead .aliasrc set filetype=config
    autocmd BufNewFile,BufRead .cmusrc set filetype=cmusrc
    autocmd BufNewFile,BufRead *.conf set filetype=conf 
"---Templets
    autocmd BufNewFile syntax on
    autocmd BufNewFile *.html 0r /home/kevin/Templates/html.tpl
    autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
    autocmd BufNewFile *.desktop 0r /home/kevin/Templates/desktop.tpl
    autocmd BufNewFile *.tex 0r /home/kevin/Templates/LaTeX.tpl
    autocmd BufNewFile *.js 0r /home/kevin/Templates/java.tpl 
    autocmd BufNewFile *.py 0r /home/kevin/Templates/python.tpl
    autocmd BufNewFile *.sh 0r /home/kevin/Templates/shellscript.tpl
    autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
"---Last Modified Hack
"

"---VimWiki AutoCommands
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
"================================================================}}}
"==============HTML Settings====================================={{{
"
" to_html settings
"let html_my_rendering=1
"let html_number_lines = 1
"let html_ignore_folding = 1
"let html_use_css = 1
"let html_no_pre = 1
"let use_xhtml = 0
"let xml_use_xhtml = 0
let g:PreviewBrowsers='vimb,firefox'
"================================================================}}}
"==============Buffer Explore  Settings===================================={{{
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>
"==========================================================================}}}
"==============CtrlP Settings=============================================={{{
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
"==========================================================================}}}
"=============Startify==============================================={{{

let g:startify_custom_header = [
    \ ' ___   ___   ______   __   __   ______       __   __   ________  ___ __ __	',
    \ '/___/\/__/\ /_____/\ /_/\ /_/\ /_____/\     /_/\ /_/\ /_______/\/__//_//_/\	',
    \ '\::.\ \\ \ \\::::_\/_\:\ \\ \ \\::::_\/_    \:\ \\ \ \\__.::._\/\::\| \| \ \	',
    \ ' \:: \/_) \ \\:\/___/\\:\ \\ \ \\:\/___/\    \:\ \\ \ \  \::\ \  \:.      \ \	',
    \ '  \:. __  ( ( \::___\/_\:\_/.:\ \\_::._\:\    \:\_/.:\ \ _\::\ \__\:.\-/\  \ \	',
    \ '   \: \ )  \ \ \:\____/\\ ..::/ /  /____\:\    \ ..::/ //__\::\__/\\. \  \  \ \	',
    \ '    \__\/\__\/  \_____\/ \___/_(   \_____\/     \___/_( \________\/ \__\/ \__\/	',
       \ ]
autocmd User StartifyBufferOpened syntax on
let g:startify_lists=[
	    \ {	'type': 'commands',	'header': ['	Commands']	},
	    \ {	'type': 'bookmarks',	'header': ['	Bookmarks']	},
\ { 'header': ['   Sessions'],       'type': 'sessions' },
	    \ ]
let g:startify_commands = ['MRU', 'VimwikiIndex', 'Calendar', 'Notes',  'NERDTree', 'Explore', ]
let g:startify_bookmarks = ['~/.zshrc', '~/.aliasrc', '~/.config/i3/config', '~/.config/nvim/init.vim', '~/.remind','~/.config/ranger/rc.conf','~/.Homepage/index.html','~/.config/ranger/rifle.conf']
" Startify on new tab
  if has('nvim')
      autocmd TabNewEntered * Startify
  else
   autocmd BufWinEnter *
        \ if !exists('t:startify_new_tab')
       \     && empty(expand('%'))
      \     && empty(&l:buftype)
     \     && &l:modifiable |
    \   let t:startify_new_tab = 1 |

   \   Startify |
  \ endif
   endif
"====================================================================}}} 
"=============File Type Settings====================================={{{

"vimtex config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode='0'
let g:indentLine_setConceal='0'
let g:tex_conceal='abdmg'
"
let g:vimwiki_table_mappings=0 "so I can tab complete
let g:notes_directories = ['~/Notes', '~/Dropbox/Shared Notes']

let g:vim_markdown_fenced_languages=['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'rb=ruby']
"=====================================================================}}}
"=============Nerdtree settings==================================={{{

"##################################################################}}}

let $FZF_DEFAULT_OPTS="--preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null'"
let g:fzf_layout = { 'down': '40%' }
let g:fzf_buffers_jump = 1
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'Conditional', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Conditional', 'Conditional'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
" Preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"============Sign's==========================================================
"========================================================================
