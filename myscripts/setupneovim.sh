#!/bin/bash

# AUTHOR: Xiaoming94
# Partial script for setting up vim.
# This is so setting up will be easier on other platforms

# Setting up variables
REPO_ROOT=$(git rev-parse --show-toplevel)
CONFIG_DIR=$REPO_ROOT/configs

cd $HOME
vimrc_file=$HOME/.vimrc

if [[ -f "$vimrc_file" ]]; then
    echo "vimrc exists"
else
    source $REPO_ROOT/myscripts/setupvim.sh
fi

echo "===== Setting up neovim ====="

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' || echo "curl is not installed!"

ln -s $CONFIG_DIR/nvim $HOME/.config/nvim

nvim +'PlugInstall --sync' +qa
