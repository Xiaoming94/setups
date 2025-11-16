# Setting ZSH_CONFIG_DIR if it's not set
if [ -z ${ZSH_CONFIG_DIR+x} ]; then
    ZSH_CONFIG_DIR=$HOME/.zshrc.d
fi

# Initializing my standard zsh environment
for file in $ZSH_CONFIG_DIR/autoload/*.zsh ; do
    source $file;
done

# Autoloading functions in $ZSH_CONFIG_DIR/functions compiling them
fpath+=$ZSH_CONFIG_DIR/functions

for file in $ZSH_CONFIG_DIR/functions/* ; do
    autoload -Uz $file
done

# Load antidote plugin manager if it exists
ANTIDOTE_DIR=$ZSH_CONFIG_DIR/antidote
if [ -d "$ANTIDOTE_DIR" ]; then
    source $ANTIDOTE_DIR/antidote.zsh
    antidote load $ZSH_CONFIG_DIR/zsh_plugins.txt
fi

# Setoptions

setopt autocd globcomplete nomatch notify
# Load the prompt based on $PROMPT_THEME

PROMPT_THEME=${PROMPT_THEME:-ming}
THEMES_DIR=$ZSH_CONFIG_DIR/themes

fpath+=$THEMES_DIR
autoload -Uz promptinit
promptinit
setopt PROMPT_SUBST

prompt "$PROMPT_THEME"
