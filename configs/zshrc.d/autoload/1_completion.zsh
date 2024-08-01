# The following lines were added by compinstall

zstyle ':completion:*' completer _list _expand _complete _ignored _match _prefix
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/xiaoming/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zmodload -i zsh/complist
