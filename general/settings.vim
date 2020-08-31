 " Enables syntax highlighing
syntax enable
" Required to keep multiple buffers open multiple buffers
set hidden
" Display long lines as oneline
set nowrap
" The encoding displayed
set encoding=utf-8
" Makes popup menu smaller
set pumheight=10
" The encoding written to file
set fileencoding=utf-8
" Show the cursor position all the time
set ruler
" Horizontal splits will automatically be below
set splitbelow
" Vertical splits will automatically be to the right
set splitright
" Support 256 color
set t_Co=256
 " So that we can see `` in markdown files
set conceallevel=0

"TABS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=2
set number
set cursorline 
" tell vim what the background color looks like
set background=dark

" Always show tabs
set showtabline=2

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=1000                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch
set autoread							" Auto read files changed externaly

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
