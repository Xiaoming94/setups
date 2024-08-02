# Setting up ls colors
if [ -z ${LS_COLORS+x} ];
    then eval "$(dircolors -b)";
fi

export LESS="-FR"  # Options passed to less

# History file
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
