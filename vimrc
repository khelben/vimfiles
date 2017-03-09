
" start of Vim-Plug section https://github.com/junegunn/vim-plug#usage
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" nova theme and suggested plugins https://trevordmiller.com/projects/nova
Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

call plug#end()
" end of Vim-Plug section

"- Vim Hackery
set laststatus=2          | " Have statusline always on
"~ set clipboard=unnamedplus | " Use system clipboard
"~ set diffopt+=vertical     | " Make Fugitive's :Gsdiff behave
set updatetime=250        | " Make gitgutter update more often
set ttimeoutlen=0         | " Fix esc key delay
set hidden                | " Make buffers persist in the background
"~ let g:pymode_rope=0       | " Fix massive delay from deoplete_jedi
" This delay is caused when using deoplete_jedi's suggestions
" when python-mode is also installed. This issue is still
" open on github:
" https://github.com/davidhalter/jedi-vim/issues/163

"- Vim Option Setup
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
"~ set inccommand=nosplit     | " Setup for Live Subsitution
" Tab setup (tab=4spaces)
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

colorscheme nova
set noswapfile             | " I don't want any swap 

" set the font for MacVim
if has('gui_running')
  set guifont=Monaco:h14
endif

"- Airline Symbol Setup
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste  = 'Þ'
let g:airline_symbols.paste  = 'ρ'

"- Airline Setup
" let g:airline#extensions#tmuxline#enabled               = 1
let g:airline#extensions#tabline#enabled                = 1
let g:airline#extensions#tabline#tab_min_count          = 2
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#bufferline#enabled             = 0
