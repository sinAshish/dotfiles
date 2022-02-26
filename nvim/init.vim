" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim
" General settings
" ---------------------------------------------------------------------------
" drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off 

" TODO: Load plugins here (pathogen or vundle)
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'catppuccin/nvim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-buftabline'


" Plug 'Valloric/YouCompleteMe' it's very heavy - don't use it

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" autocmd vimenter * NERDTree

" Turn on syntax highlighting
syntax on
" enable syntax processing
syntax enable

" For plugins to load correctly
filetype plugin indent on


" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start

" don't create `filename~` backups
" set nobackup

" don't create temp files
" set noswapfile

" line numbers and distances
" set relativenumber 
set number 

" number of lines offset when jumping
set scrolloff=2

" Tab key enters 2 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 

" Indent new line the same as the preceding line
set autoindent
set smartindent

" statusline indicates insert or normal mode
set showmode showcmd

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase

" As opposed to `wrap`
"set nowrap

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" open new buffers without saving current modifications (buffer remains open)
set hidden
noremap <C-N> :bnext<CR>
noremap <C-P> :bprev<CR>

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

" Show character column
" highlight ColorColumn ctermbg=DarkBlue
" set colorcolumn=80

" CursorLine - sometimes autocmds are not performant; turn off if so
" http://vim.wikia.com/wiki/Highlight_current_line
set cursorline
" Normal mode
" highlight CursorLine ctermbg=None
" autocmd InsertEnter * highlight  CursorLine ctermbg=17 ctermfg=None
" autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None

