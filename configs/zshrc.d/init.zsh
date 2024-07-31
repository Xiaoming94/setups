# Setting ZDOTDIR if it's not set
if [ -z ${ZDOTDIR+x} ]; then
    ZDOTDIR=$HOME/.zshrc.d
fi

# Initializing my standard zsh environment
for file in $ZDOTDIR/autoload/* ; do
    source $file;
done

# Load antidote plugin manager if it exists
ANTIDOTE_DIR=$ZDOTDIR/antidote
if [ -d "$ANTIDOTE_DIR" ]; then
    source $ANTIDOTE_DIR/antidote.zsh
    antidote load
fi
