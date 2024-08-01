# Setting up ls colors
if [ -z ${LS_COLORS+x} ];
    # If OMZ is installed, then it will export LS_COLORS
    then eval "$(dircolors -b)";
fi

export LESS=FRX  # Options passed to less
