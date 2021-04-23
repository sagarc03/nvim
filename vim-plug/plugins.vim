" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'ueaner/molokai'
Plug 'joshdick/onedark.vim'
Plug 'ghifarit53/tokyonight-vim'

" NerdTree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"" Files
Plug 'tpope/vim-eunuch'

"" Repeat stuff
Plug 'tpope/vim-repeat'

"" Surround
Plug 'tpope/vim-surround'

"" Better Comments
Plug 'tpope/vim-commentary'

"" Have the file system follow you around
Plug 'airblade/vim-rooter'

"" auto set indent settings
Plug 'tpope/vim-sleuth'

"" Text Navigation and Jumping
Plug 'unblevable/quick-scope'
Plug 'easymotion/vim-easymotion'

"" Add some color
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'

"" Cool Icons
Plug 'ryanoasis/vim-devicons'

"" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
"
"" Status Line
Plug 'vim-airline/vim-airline'

" Ranger integration(revisit)
" Plug 'kevinhwang91/rnvimr'

"" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

"" Terminal
Plug 'voldikss/vim-floaterm'

"" Start Screen
Plug 'mhinz/vim-startify'

"" See what keys do like in emacs
Plug 'liuchengxu/vim-which-key'

"" Debugging
Plug 'puremourning/vimspector'

"" Better tabline
"Plug 'mg979/vim-xtabline'

"" undo time travel
Plug 'mbbill/undotree'

"" Find and replace
Plug 'brooth/far.vim'


"" Smooth scroll
Plug 'psliwka/vim-smoothie'

"" Multiple Cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'moll/vim-bbye'

"" Editor config to work with .editorconfig file
Plug 'editorconfig/editorconfig-vim'

" Did you mean
Plug 'EinfachToll/DidYouMean'

" Org mode
Plug 'axvr/org.vim'

" Dash.app integration for mac
Plug 'rizzatti/dash.vim'

" Snippets
Plug 'honza/vim-snippets'

"""""""""""""" Plugin Graveyard """"""""""""""""""""""""""""""""""""

"" highlight all matches under cursor
"Plug 'RRethy/vim-illuminate'

"" Auto change html tags
" Plug 'AndrewRadev/tagalong.vim'

"" live server
" Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }

"" Markdown Preview
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

"" RST Preview
" Plug 'Rykka/riv.vim'

"" Async Linting Engine
" Plug 'dense-analysis/ale'

""" Plugin for go
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'gu-fan/InstantRst'
" Plug 'gu-fan/rhythm.css'


" Typescript syntax
" Plug 'herringtondarkholme/yats.vim'

" Vue JS syntax highlighting
" Plug 'posva/vim-vue'
" Plug 'pangloss/vim-javascript'
" JSX syntax
" Plug 'maxmellon/vim-jsx-pretty'

" Prettier - automatically format file according to rules/editorconfig
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" to work with HTML/XML tags, see https://www.vim.org/scripts/script.php?script_id=1397
" Plug 'othree/xml.vim'

" html5
" Plug 'othree/html5.vim'

" SCSS syntax
" Plug 'cakebaker/scss-syntax.vim'

" Ranger
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'


" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif
