" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim
" General settings
" ---------------------------------------------------------------------------
" drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible
set termguicolors

" Helps force plugins to load correctly when it is turned back on below
filetype on
let g:coc_disable_startup_warning = 1
set encoding=UTF-8

" TODO: Load plugins here (pathogen or vundle)
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'junegunn/goyo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'adelarsq/vim-devicons-emoji'
Plug 'aserowy/tmux.nvim'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" List ends here. Plugins become visible to Vim after this call.

call plug#end()
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre "*" let s:std_in=1
autocmd VimEnter "*" if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter "*" NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter "*" if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Turn on syntax highlighting
syntax on
" enable syntax processing
syntax enable

" For plugins to load correctly
filetype plugin indent on

" number of lines at the beginning and end of files checked for file-specific vars
set modelines=1


" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter "*" :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs="iso-2022-jp,euc-jp,cp932,ucs-bom,utf-8,default,latin1"
au FocusLost,WinLeave * :silent! w

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start

" don't create `filename~` backups
" set nobackup

" don't create temp files
set noswapfile

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
"set mouse=r

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
" https://stackoverflow.com/questions/2066590/automatically-quit-vim-if-nerdtree-is-last-and-only-buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


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

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter "*" silent loadview

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" map keyboard shortcuts for copying and pasting from or to vim
set mouse+=a
"vmap <C-C> "+y
"vmap <C-V> "+p

vnoremap <C-S-C> "+y
vnoremap <C-S-V> "+p


" vnoremap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
" noremap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" automatically close NERDTree after a file has been opened
let NERDTreeQuitOnOpen=3

" mapping to toggle NERDTree view
nnoremap <C-S> :NERDTreeToggle<CR>

" move across wrapped lines in normal mode
nnoremap k gk
nnoremap j gj

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
" Use coc for autocompletion and linting
" The path may be different depending on your system
let g:coc_global_extensions = ['coc-python',  'coc-markdownlint']
" Set up coc extensions for different languages
let g:coc_filetype_map = {
  \ 'python': 'coc-python',
  \ 'markdown': 'coc-markdownlint'
  \ }

" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
function! CloseHiddenBuffers()
    " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    " close any buffers hidden
    " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    let open_buffers = []

    for i in range(tabpagenr('$'))
        call extend(open_buffers, tabpagebuflist(i + 1))
    endfor

    for num in range(1, bufnr("$") + 1)
        if buflisted(num) && index(open_buffers, num) == -1
            exec "bdelete ".num
        endif
    endfor
endfunction

au BufEnter * call CloseHiddenBuffers()

" ale linter settings
let b:ale_fixers = {
      \ 'python': ['black'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \}

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
