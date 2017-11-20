
" start of Vim-Plug section https://github.com/junegunn/vim-plug#usage
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" vim-go plugin
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'majutsushi/tagbar'

" Elixir plugins
Plug 'elixir-lang/vim-elixir'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features
Plug 'slashmili/alchemist.vim'
let g:alchemist_tag_map = '<C-d>'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" cucumber
Plug 'tpope/vim-cucumber'
" TODO: docs
" ]d to go to the definition of a step

" General
Plug 'ludovicchabant/vim-gutentags'  " Auto generate tags upon save etc
let g:gutentags_cache_dir = '~/.tags_cache'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ctrlpvim/ctrlp.vim'
" Once CtrlP is open:
"
"     Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"     Press <c-f> and <c-b> to cycle between modes.
"     Press <c-d> to switch to filename only search instead of full path.
"     Press <c-r> to switch to regexp mode.
"     Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"     Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"     Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"     Use <c-y> to create a new file and its parent directories.
"     Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"
" Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.
Plug 'scrooloose/nerdtree'

" Git helpers
Plug 'tpope/vim-fugitive'

" Misc
Plug 'tomtom/tcomment_vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'mileszs/ack.vim'

" Themes
Plug 'arcticicestudio/nord-vim'

call plug#end()
" end of Vim-Plug section

"- Vim Hackery
set laststatus=2          | " Have statusline always on
"~ set clipboard=unnamedplus | " Use system clipboard
set diffopt+=vertical     | " Make Fugitive's :Gsdiff behave
set updatetime=250        | " Make gitgutter update more often
set ttimeoutlen=0         | " Fix esc key delay
set hidden                | " Make buffers persist in the background
"~ let g:pymode_rope=0       | " Fix massive delay from deoplete_jedi
" This delay is caused when using deoplete_jedi's suggestions
" when python-mode is also installed. This issue is still
" open on github:
" https://github.com/davidhalter/jedi-vim/issues/163

"- Vim Option Setup
" proper backspacing
set backspace=indent,eol,start | " see :help 'backspace'
" Line number
set number                 | " Turn on line numbers
"~ set relativenumber         | " Make line numbers relative to cursor
set cursorline             | " Highlight the currenty selected line
" On-screen cues
set showcmd                | " Show letters as they're typed
set noshowmode             | " Use Airline instead
" Pane setup
set splitright             | " Make vertical splits open to the right
set splitbelow             | " Make horiontal splits open to the bottom
" Indentation
set autoindent             | " Autoindent when creating a new line
set copyindent             | "
set shiftround             | "
set foldmethod=indent      | " by default, fold using indentation
set nofoldenable           | " don't fold by default
set foldlevel=0            | " if fold everything if 'foldenable' is set
" Search Setup
set smartcase              | "
set incsearch              | "
set hlsearch               | "
"~ set inccommand=nosplit     | " Setup for Live Subsitution
" Tab setup (tab=2spaces)
set tabstop=2              | "
set softtabstop=0          | "
set expandtab              | "
set shiftwidth=2           | "
set smarttab               | "
" Turn off bells
set noerrorbells           | " Try to disable error bells
set visualbell             | " Use visual bell instead of a beep
set t_vb=                  | " Set visual bell action to no action
" History and Undo Setup
set undolevels=99999       | " Set max number of undo actions saved
set undodir=~/.vim/undodir | " Set directory to store undo files
set undofile               | " Make undo history persistent
set history=1000           | "

" see https://github.com/arcticicestudio/nord for colorschemes for other apps
colorscheme nord
set noswapfile             | " I don't want any swap
set mouse=a                | " use mouse if possible
set wildmenu               | " allows to use tab in command mode

set autoread               | " auto read changed files

let mapleader=","

" set the font for MacVim
if has('gui_running')
  set guifont=Inconsolata\ Regular:h16
endif

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"- Airline Symbol Setup
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.paste  = 'Þ'
" let g:airline_symbols.paste  = 'ρ'

"- Airline Setup
" let g:airline#extensions#tmuxline#enabled               = 1
let g:airline#extensions#tabline#enabled                = 1
let g:airline#extensions#tabline#tab_min_count          = 2
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#bufferline#enabled             = 0
let g:airline_theme='bubblegum'

"- Tagbar mappings
nmap <leader>tb :TagbarToggle<CR>

" Tagbar Elixir understandings
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

" vim-ack settings
let g:ackprg = 'ag --vimgrep --smart-case'
nnoremap <leader>a :Ack!<Space>

" Some navigation helpers
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" switch between splits easily
nnoremap <leader>w <C-w><C-w>

" clear current highlighted search
nnoremap <leader>cs :noh<cr>

" NERDTree mappings
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nc :NERDTreeClose<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
