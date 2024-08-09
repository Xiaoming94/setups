# Setting up ls colors

eval "$(dircolors -b)";

export LESS="-FR"  # Options passed to less

# History file
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
