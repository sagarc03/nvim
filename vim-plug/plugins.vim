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

" NerdTree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

"" Files
Plug 'tpope/vim-eunuch'
"" Repeat stuff
Plug 'tpope/vim-repeat'
"" Surround
Plug 'tpope/vim-surround'
"
"" Better Comments
Plug 'tpope/vim-commentary'
"
"" Have the file system follow you around
Plug 'airblade/vim-rooter'
"" auto set indent settings
Plug 'tpope/vim-sleuth'

"" Text Navigation
Plug 'unblevable/quick-scope'

"" Add some color
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'

"" Better Syntax Support
Plug 'sheerun/vim-polyglot'

"" Cool Icons
Plug 'ryanoasis/vim-devicons'
"" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

"" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
"
"" Status Line
Plug 'vim-airline/vim-airline'
""Plug 'kevinhwang91/rnvimr'

"" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

"" Terminal
"Plug 'voldikss/vim-floaterm'

"" Start Screen
Plug 'mhinz/vim-startify'

"" See what keys do like in emacs
"Plug 'liuchengxu/vim-which-key'

"" Snippets
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

"" Debugging
"" Plug 'puremourning/vimspector'

"" Better tabline
"Plug 'mg979/vim-xtabline'

"" undo time travel
"Plug 'mbbill/undotree'

"" highlight all matches under cursor
"Plug 'RRethy/vim-illuminate'

"" Find and replace
Plug 'brooth/far.vim'

"" Auto change html tags
Plug 'AndrewRadev/tagalong.vim'

"" live server
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }

"" Smooth scroll
Plug 'psliwka/vim-smoothie'

"" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

"" RST Preview
Plug 'Rykka/riv.vim'

"" Multiple Cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'moll/vim-bbye'

"" Editor config to work with .editorconfig file
Plug 'editorconfig/editorconfig-vim'

"" Async Linting Engine
Plug 'dense-analysis/ale'

""" Plugin for go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'gu-fan/InstantRst'
Plug 'gu-fan/rhythm.css'

" Did you mean
Plug 'EinfachToll/DidYouMean'
"" Plugin Graveyard

" Typescript syntax
Plug 'herringtondarkholme/yats.vim'

" Vue JS syntax highlighting
Plug 'posva/vim-vue'

" JSX syntax
Plug 'maxmellon/vim-jsx-pretty'

" Prettier - automatically format file according to rules/editorconfig
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" to work with HTML/XML tags, see https://www.vim.org/scripts/script.php?script_id=1397
Plug 'othree/xml.vim'

" html5
Plug 'othree/html5.vim'

" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'

" Ranger
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif
