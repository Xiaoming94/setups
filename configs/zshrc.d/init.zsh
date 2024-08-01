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

# Load the prompt based on $PROMPT_THEME
PROMPT_THEME=${PROMPT_THEME:-default}
THEMES_DIR=$ZDOTDIR/themes

source "$THEMES_DIR/$PROMPT_THEME.zsh"
