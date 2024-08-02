#!/bin/bash

# AUTHOR: Xiaoming94
# Partial script for setting up vim.
# This is so setting up will be easier on other platforms

# Setting up variables
REPO_ROOT=$(git rev-parse --show-toplevel)
CONFIG_DIR=$REPO_ROOT/configs

echo "===== Setting up vim ====="

# Setting up vim with vim-plugs

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
            || echo "curl is not installed, install curl"

# Setting up symlinks
ln -s $CONFIG_DIR/vimrc.d $HOME/.vimrc.d
ln -s $CONFIG_DIR/vimrc $HOME/.vimrc
ln -s $CONFIG_DIR/myzshrc $HOME/.myzshrc     # symlinking personal config file
touch $HOME/.vimrc.user

vim +'PlugInstall --sync' +qa
