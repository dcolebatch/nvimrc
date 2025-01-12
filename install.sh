#!/bin/sh
set -e

cd ~/.vim

mkdir -p ~/.config/nvim/
echo 'set runtimepath+=~/.vim

source ~/.vim/vimrcs/plugins.vim
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/extended.vim
" my config
try
    source ~/.vim/vimrcs/my_configs.vim
catch
endtry' > ~/.config/nvim/init.vim

echo "Installed the Ultimate Newovim configuration successfully! Enjoy :-)"
