
" load pathogen
execute pathogen#infect()

" enable all options available in vim that are not available in vi
set nocompatible

" set encoding to utf-8
set fileencoding=utf-8
set encoding=utf-8

syntax on
filetype on
filetype indent on
filetype plugin on

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes in iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


" ==============Guiding hands===============
" no arrow keys for you!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" highlight ColorColumn ctermbg=105 "LightSlateBlue
highlight ColorColumn ctermbg=117 "SkyBlue
set colorcolumn=100


" ==============General Config===============
set number                      "Show line numbers
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=100                 "Store the last 100 cmdline commands
set showcmd                     "Show incomplete cmds at the bottom
set showmode                    "Show current mode down bottom
set gcr=a:blinkon0              "Disable cursor blink

set novisualbell                "No annoying flashing
set noerrorbells                "No annoying sounds
set t_vb=
set tm=500

set autoread                    "Reload files changed outside vim
set cursorline                  "Show cursor line across screen
set hidden                      "Allows buffers to exist in background
set scrolloff=8                 "always keep 8 lines between cursor and screen top or bottom
set tags=tags;/                 "search for tags from current file up


" ==============Indentation==============
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set shiftround


" ==============No Swap Files===============
set noswapfile
set nobackup
set nowb


" ==============Window Options==============
set winwidth=84 " side by side win width min size for focused window
" set winheight=5 " vertical window size when not focused
" set winminheight=5 "vertical window size when not focused
set winheight=999 "use all available window height not taken up by min wins

" set gui options
set guifont=PragmataPro
set guioptions=aAc "enable autoselect in gVim
set guioptions-=Be "remove scrollbar and toolbar in gVim

" show tabs, trailing space and eol
" set list
" set listchars=tab:➤\ ,eol:↴
" set listchars+=trail:◇

set nowrap      "don't wrap lines
set linebreak   "wrap lines at convenient points


" ==============Folds==============
" set foldmethod=indent     "fold based on indent
" set foldnestmax=3         "deepest fold is 3 levels
" set nofoldenable          "don't fold by default
set foldmethod=marker
set foldmarker={{{,}}}


" ==============Completion==============
set wildmenu                  "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=full
" set wildmode=list:longest
set wildignore+=*vim/backups*
set wildignore+=*.gem " ruby gems"
set wildignore+=log/** " log files"
set wildignore+=tmp/** " tmp files"
set wildignore+=*.png,*.jpg,*.gif,*.tif
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.class "java/scala class files"
set wildignore+=*/target/* "sbt target directory"


" ==============Search and Replace==============

" ignore case during search
set ignorecase
set hlsearch "highlight search
set autoindent "indentation automatically

" enable smart searching
set smartcase

" default is to always apply substitutions globally
set gdefault

" start searching while typing
set incsearch

" highlighting matching open and close symbols
set showmatch


" ==============Color Scheme==============
" Solarized
syntax enable
let g:solarized_termcolors = 256
colorscheme solarized

" color background and solarize text to match
if has ("gui_running")
    set background=light
else
    set background=dark
endif



" ==============Special Filetypes==============
" .ru files are Ruby
au BufRead,BufNewFile *.ru setfiletype ruby


" ==============Plugin Settings===============
" nerdtree - open nerdtree automatically when starting vim if no file is specified
autocmd vimenter * if !argc() | NERDTree | endif

" plasticboy markdown - disable folding
let g:vim_markdown_folding_disabled=1

" rainbow parentheses
" - Options
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" - Set to be always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ==============Key Remaps===============
" remap leader key to comma
let mapleader=","

" remap space to search and c-space to backwards search
map <space> /
map <c-space> ?

" Remap VIM 1 to first non-blank character
map 1 ^

" Remap VIM 0 to first non-blank character
map 0 $

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" tcomment - sublime style comment/uncomment key mapping
map // <c-_><c-_>

" nerdtree - use control+o to open a nerdtree window
map <C-n> :NERDTreeToggle<CR>

" vim-scala - format scala code
let g:scala_sort_across_groups=1
au BufEnter *.scala setl formatprg=java\ -jar\ /home/peter/exec/scalariform.jar\ -f\ -q\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +rewriteArrowSymbols\ +preserveSpaceBeforeArguments\ --stdin\ --stdout
nmap <leader>m :SortScalaImports<CR>gggqG<C-o><C-o><leader><w>


" ============Function Key Mappings============
" F2 = set paste (pastetoggle http://stackoverflow.com/questions/2861627/paste-in-insert-mode)
set pastetoggle=<F2>

" F3 = NumberToggle() (toggle relative and absolute line numbers)
 nnoremap <F3> :call NumberToggle()<cr>

" F4 = git-gutter (toggle the gutter)
nnoremap <F4> :GitGutterToggle<CR>

" F5 = execute python file as if in idle
noremap <F5> :! clear && python % \| less<cr>

" F8 = tagbar plugin (toggle ctag panel)
nmap <F8> :TagbarToggle<CR>

" F9 = ToggleWrap() (toggle soft line wrapping)
noremap <F9> :call ToggleWrap()<cr>


" ==============Functions==============
" toggle relative line numbers with color coding
"
 function! NumberToggle()
     if(&relativenumber == 1)
         set norelativenumber
         set number
         highlight LineNr ctermfg=yellow
     else
         set relativenumber
         highlight LineNr ctermfg=green
     endif
 endfunc

" toggle soft line wrap
"
function ToggleWrap()
    if (&wrap == 1)
        set nowrap
    else
        set wrap linebreak textwidth=0
    endif
endfunction

" http://robots.thoughtbot.com/faster-grepping-in-vim/
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif


" ==============Leader Commands==============

" quickly open vimrc in vertical split window
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<cr>

" no highlighting quickly
nnoremap <leader><space> :noh<cr>

" run current scala file
nnoremap <leader>s :! clear && /opt/scala/bin/scala %<cr>

" run current scala file with args
nnoremap <leader>sc :! clear && /opt/scala/bin/scala % 

" run fsc with args
nnoremap <leader>fsc :! clear && /opt/scala/bin/fsc % 

" shutdown fsc
nnoremap <leader>nofsc :! clear && /opt/scala/bin/fsc -shutdown <cr>

" rake preview shortcut
nnoremap <leader>rp :! rake preview<cr>

" run django tests
nnoremap <leader>dt :! clear && manage.py test<cr>

" git status
nnoremap <leader>gs :! clear && git status<cr>

" git add all and commit
nnoremap <leader>gac :! git add . && git commit -am"
