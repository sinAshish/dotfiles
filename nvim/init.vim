" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim
" General settings
" ---------------------------------------------------------------------------
" drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible
set termguicolors

" Helps force plugins to load correctly when it is turned back on below
filetype off 
let g:coc_disable_startup_warning = 1


" TODO: Load plugins here (pathogen or vundle)
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'airblade/vim-gitgutter'
Plug 'psf/black', { 'branch': 'stable' }
" Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'adelarsq/vim-devicons-emoji'
Plug 'aserowy/tmux.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
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
set mouse=v
" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs="iso-2022-jp,euc-jp,cp932,ucs-bom,utf-8,default,latin1"

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

let g:catppuccin_flavour = "mocha" "latte, frappe. macchiato, mocha
" colorscheme catppuccin

lua require("catppuccin").setup()
lua require("tmux").setup()
lua require('nvim-web-devicons').setup()
lua require('nvim-web-devicons').get_icons()

colorscheme catppuccin

lua require('lualine').setup({options = {theme = "catppuccin"}})
" lua require('lualine').setup()

" use <tab> for trigger completion and navigate to the next complete item    
function! s:check_back_space() abort                                                                                                          
  let col = col('.') - 1    
  return !col || getline('.')[col - 1]  =~ '\s'    
endfunction    
     
inoremap <silent><expr> <Tab>    
      \ pumvisible() ? "\<C-n>" :    
      \ <SID>check_back_space() ? "\<Tab>" :    
      \ coc#refresh()  
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

