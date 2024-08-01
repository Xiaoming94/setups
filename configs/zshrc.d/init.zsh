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
    antidote load $ZDOTDIR/zsh_plugins.txt
fi

# Setoptions

setopt autocd globcomplete nomatch notify
# Load the prompt based on $PROMPT_THEME

PROMPT_THEME=${PROMPT_THEME:-ming}
THEMES_DIR=$ZDOTDIR/themes

fpath=($THEMES_DIR $fpath)
autoload -Uz promptinit
promptinit
setopt PROMPT_SUBST

prompt "$PROMPT_THEME"
