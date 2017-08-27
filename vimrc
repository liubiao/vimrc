set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jiangmiao/auto-pairs'
Bundle 'scrooloose/syntastic'
Bundle 'Yggdroot/indentLine'

"vim indent object (useful for python editing)
Bundle 'michaeljsmith/vim-indent-object'
"Bundle 'davidhalter/jedi'

call vundle#end()
filetype plugin indent on

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<C-j>'

" generate c,c++ tags, rename it as c-tags, put it in ~/.vim/
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/c-tags /usr/include
autocmd FileType c,cpp setlocal tags=~/.vim/c-tags,./tags;/,tags;/

" generate python tags, rename it as py-tags, put it in ~/.vim
" ctags -R --fields=+l --languages=python --python-kinds=-iv -f ~/.vim/py-tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")
autocmd FileType python setlocal tags=~/.vim/py-tags,./tags;/,tags;/

syntax enable
syntax on

" for mac
set backspace=2

" Tab Width
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Indent
set smartindent

set number
set tags=tags;
set autochdir
" set nocp

" For search
set ignorecase smartcase
set incsearch
set hlsearch

set noerrorbells
set laststatus=2

" Window Manager and TagList
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap wm :WMToggle<cr>

" QuickFix
"nmap <F9> :cn<cr>
"nmap <F10> :cp<cr>

" select all
"nmap <C-a> ggVG 
nmap zz <C-z> 

" hot keys for comment and de-comment 
autocmd FileType python map , I#<ESC> 
autocmd FileType python map ; :s/^\(\s*\)#/\1/<CR> :nohl<CR> 
autocmd FileType c,cpp,java map , I//<ESC> 
autocmd FileType c,cpp,java map ; :s/^\(\s*\)\/\//\1/<CR> :nohl<CR>

" shift among tabs
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

colorscheme desert
"autocmd FileType python set expandtab
set expandtab
"autocmd FileType map <F11> :!python %<CR>

set t_Co=256

set encoding=utf-8
set termencoding=utf-8

" For omni cpp complete
let OmniCpp_MayCompleteDot=1    
let OmniCpp_MayCompleteArrow=1 
let OmniCpp_MayCompleteScope=1
let OmniCpp_NamespaceSearch=1 
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"] 
let OmniCpp_ShowPrototypeInAbbr=2


" Color for popup menu
colors ron
hi PmenuSel ctermbg=lightblue

set completeopt-=preview
set completeopt+=menu,menuone

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
set statusline=\ %{CurDir()}/%f%=%4l,%4c,%4p%%\ 
