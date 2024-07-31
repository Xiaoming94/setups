# Setting ZDOTDIR if it's not set
if [ -z ${ZDOTDIR+x} ]; then
    ZDOTDIR=$HOME/.zshrc.d
fi

# Initializing my standard zsh environment
for file in $ZDOTDIR/autoload/* ; do
    source $file;
done
