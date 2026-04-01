#!/bin/bash

rm $HOME/.config/nvim

rm $HOME/.vimrc
rm $HOME/.vimrc.d

REPO_ROOT=$(git rev-parse --show-toplevel)

MING_VIMRC_PATH="$REPO_ROOT/../ming_vimrc"
{ git clone git@github.com:Xiaoming94/ming_vimrc $MING_VIMRC_PATH ||
	git clone https://github.com/Xiaoming94/ming_vimrc $MING_VIMRC_PATH; } &&
	sh $MING_VIMRC_PATH/setupneovim.sh
