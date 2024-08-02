#!/bin/bash

# AUTHOR: Xiaoming94
# This is a script for setting up zsh with the homemade zsh config in this repo
# if OMZ=1 then it will install Oh-my-zsh instead
# Assumes that zsh is already installed on the machine

# Setting up different components and symlinking configs

REPO_ROOT=$(git rev-parse --show-toplevel)
CONFIG_DIR=$REPO_ROOT/configs
SCRIPTS_DIR=$REPO_ROOT/myscripts

function setupOmz () {
    ln -s $CONFIG_DIR/myzshrc $HOME/.myzshrc
    echo "===== installing oh-my-zsh ====="
    
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    echo "SETUP_REPO=$REPO_ROOT" >> .zshrc       # Remember the config repo directory
    echo "source ~/.myzshrc" >> .zshrc          # Sourcing personal config file
    
    echo "ZSH and oh-my-zsh is setup and running, setup themes and plugins yourself"
    echo "Any config should be done through .myzshrc" 
}

function setupmyzsh () {
    echo "===== Creating symbolic links ====="
    ln -s $CONFIG_DIR/zshrc.d $HOME/.zshrc.d
    if [ ! -z ${SETUP_ANTIDOTE+x} ]; then 
        echo "===== Setting up antidote ====="
        git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.zshrc.d/antidote
    fi
    echo "===== Copying default zshrc into '$HOME' ===== "
    cp $CONFIG_DIR/default.zshrc $HOME/.zshrc
}

cd $HOME

ln -s $CONFIG_DIR/zshenv $HOME/.zshenv
ln -s $CONFIG_DIR/zprofile $HOME/.zprofile

if [ -z ${OMZ+x} ]; then
    setupmyzsh
else
    setupOmz
fi
