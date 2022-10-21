" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim
" General settings
" ---------------------------------------------------------------------------
" drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible
<<<<<<< HEAD
" set termguicolors

if exists('+termguicolors')
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme catppuccin_mocha
=======
set termguicolors

if !has('gui_running')
  set t_Co=256
endif

let g:coc_disable_startup_warning = 1

>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
" Helps force plugins to load correctly when it is turned back on below
filetype off 
let g:coc_disable_startup_warning = 1

<<<<<<< HEAD
" https://vi.stackexchange.com/questions/31491/why-does-my-lightline-status-line-not-show-up-right-away
" autocmd VimEnter * call lightline#update()

let g:skip_defaults_vim = 1

if !has('gui_running')
  set t_Co=256
endif


=======
>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
" TODO: Load plugins here (pathogen or vundle)
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
<<<<<<< HEAD
Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'catppuccin/vim', {'as': 'catppuccin'}
Plug 'airblade/vim-gitgutter'
Plug 'psf/black', { 'branch': 'stable' }
" Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'preservim/nerdtree'
Plug 'adelarsq/vim-devicons-emoji'
Plug 'ryanoasis/vim-devicons'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-buftabline'

Plug 'itchyny/lightline.vim'  
=======
" Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'valloric/youcompleteme'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'preservim/nerdtree'
Plug 'adelarsq/vim-devicons-emoji'
Plug 'davidhalter/jedi-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-buftabline'

>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
" Plug 'Valloric/YouCompleteMe' it's very heavy - don't use it

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" autocmd vimenter * NERDTree

<<<<<<< HEAD
=======
"lua require("catppuccin").setup()   
"lua require('lualine').setup()
>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
" Turn on syntax highlighting
syntax on
" enable syntax processing
syntax enable

<<<<<<< HEAD
" colorscheme "catppuccin_mocha"
=======
>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
" For plugins to load correctly
filetype plugin indent on


" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread
<<<<<<< HEAD
=======

>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
<<<<<<< HEAD
set fencs="iso-2022-jp,euc-jp,cp932,ucs-bom,utf-8,default,latin1"

""  errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start
=======
set fencs=iso-2022-jp,euc-jp,cp932

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
" set backspace=indent,eol,start
>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762

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
<<<<<<< HEAD
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
=======
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 
>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762

" Indent new line the same as the preceding line
set autoindent
set smartindent
<<<<<<< HEAD
set smarttab      " be smart when using tabs 
=======
>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762

" statusline indicates insert or normal mode
set showmode showcmd

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
<<<<<<< HEAD
set hlsearch incsearch ignorecase smartcase cindent
=======
set hlsearch incsearch ignorecase smartcase
>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762

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

<<<<<<< HEAD
" return to last edit position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif
" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus
set noshowcmd
set listchars=tab:--
set noshowmode
set shortmess+=F
=======
" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
" Show character column
" highlight ColorColumn ctermbg=DarkBlue
set colorcolumn=100

" CursorLine - sometimes autocmds are not performant; turn off if so
" http://vim.wikia.com/wiki/Highlight_current_line
set cursorline
" Normal mode
" highlight CursorLine ctermbg=None
" autocmd InsertEnter * highlight  CursorLine ctermbg=17 ctermfg=None
" autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None

set foldmethod=syntax
set foldlevel=99

<<<<<<< HEAD
" let g:colorscheme = "catppuccin_mocha"
let g:lightline = {'colorscheme': 'catppuccin_mocha'}  

" https://vi.stackexchange.com/questions/31491/why-does-my-lightline-status-line-not-show-up-right-away
" autocmd VimEnter * call lightline#update()

set mouse=v

" use <tab> for trigger completion and navigate to the next complete item    
=======
let g:catppuccin_flavour = "mocha" "latte, frappe. macchiato, mocha
lua require("catppuccin").setup()
colorscheme catppuccin
" let g:lightline = {'colorscheme': 'catppuccin_mocha'}

lua require('lualine').setup({options = {theme = "catppuccin"}})
lua require('lualine').setup()

" use <tab> for trigger completion and navigate to the next complete item
>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
function! s:check_back_space() abort                                                                                                          
  let col = col('.') - 1    
  return !col || getline('.')[col - 1]  =~ '\s'    
endfunction    
     
inoremap <silent><expr> <Tab>    
      \ pumvisible() ? "\<C-n>" :    
      \ <SID>check_back_space() ? "\<Tab>" :    
      \ coc#refresh()  
<<<<<<< HEAD
=======

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

>>>>>>> 907633e6cad492037c92e96a0af153d97c63e762
