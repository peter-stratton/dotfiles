﻿" enable all options available in vim that are not available in vi
set nocompatible

" set encoding to utf-8
set fileencoding=utf-8
set encoding=utf-8

" load pathogen
execute pathogen#infect()

" ==============General Config===============
set number                      "Show line numbers
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=100                 "Store the last 100 cmdline commands
set showcmd                     "Show incomplete cmds at the bottom
set showmode                    "Show current mode down bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline                  "Show cursor line across screen
set hidden                      "Allows buffers to exist in background

" remap leader key to comma
let mapleader=","

"turn syntax highlighting on
syntax on

" ==============Plugin Settings===============
" tcomment - sublime style comment/uncomment key mapping
map // <c-_><c-_>

" nerdtree - use control+o to open a nerdtree window
map <C-n> :NERDTreeToggle<CR>

" nerdtree - open nerdtree automatically when starting vim if no file is specified
autocmd vimenter * if !argc() | NERDTree | endif

" plasticboy markdown - disable folding
let g:vim_markdown_folding_disabled=1

" ==============Guiding hands===============
" no arrow keys for you!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ==============No Swap Files===============
set noswapfile
set nobackup
set nowb

" ==============Folds==============
" set foldmethod=indent     "fold based on indent
" set foldnestmax=3         "deepest fold is 3 levels
" set nofoldenable          "don't fold by default
set foldmethod=marker
set foldmarker={{{,}}}

" ==============Completion==============
set wildmenu                  "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif,*.tif

" ==============Indentation==============
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set shiftround

filetype on
filetype indent on
filetype plugin on

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
set listchars=tab:➤\ ,eol:↴
set listchars+=trail:◇

set nowrap      "don't wrap lines
set linebreak   "wrap lines at convenient points

" ==============Color Scheme==============
" color background and solarize text to match
if has ("gui_running")
  set background=light
else
  set background=dark
endif

" ==============Special Filetypes==============
" .ru files are Ruby
au BufRead,BufNewFile *.ru setfiletype ruby

" ==============Status Line==============
hi User1 ctermbg=white  ctermfg=black   guibg=#89A1A1   guifg=#002836
hi User2 ctermbg=red    ctermfg=white   guibg=#aa0000   guifg=#89a1a1


" ==============Functions==============
" smarter tab completion
"
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\tab"
  else
    return "\<c-p>"
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

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

 nnoremap <c-\> :call NumberToggle()<cr>

" toggle soft line wrap
"
function ToggleWrap()
    if (&wrap == 1)
        set nowrap
    else
        set wrap linebreak textwidth=0
    endif
endfunction

noremap <F9> :call ToggleWrap()<cr>

" execute python file as if in idle
"
noremap <F5> :! python %<cr>

" ==============Leader Commands==============

" quickly open vimrc in vertical split window
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<cr>

" no highlighting quickly
nnoremap <leader><space> :noh<cr>

" rake preview shortcut
nnoremap <leader>rp :! rake preview<cr>

" run django tests
nnoremap <leader>dt :! clear && manage.py test<cr>

" git status
nnoremap <leader>gs :! clear && git status<cr>

" git add all and commit
nnoremap <leader>gac :! git add . && git commit -am
