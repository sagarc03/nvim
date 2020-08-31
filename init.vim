set nocompatible
let g:python_host_prog = '/Users/schavan/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/schavan/.pyenv/versions/neovim3/bin/python'

" General Settings
source $HOME/.config/nvim/general/keys.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

" Themes
source $HOME/.config/nvim/themes/gruvbox.vim

" Plugins Config
source $HOME/.config/nvim/plugin-config/fzf.vim
source $HOME/.config/nvim/plugin-config/nerdtree.vim
source $HOME/.config/nvim/plugin-config/airline.vim
source $HOME/.config/nvim/plugin-config/far.vim
source $HOME/.config/nvim/plugin-config/scope.vim
source $HOME/.config/nvim/plugin-config/polyglot.vim
source $HOME/.config/nvim/plugin-config/coc.vim
source $HOME/.config/nvim/plugin-config/fugitive.vim
source $HOME/.config/nvim/plugin-config/git-messenger.vim
source $HOME/.config/nvim/plugin-config/bye.vim
source $HOME/.config/nvim/plugin-config/ale.vim
source $HOME/.config/nvim/plugin-config/go.vim
source $HOME/.config/nvim/plugin-config/startify.vim
