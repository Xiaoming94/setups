# $ ls variations

alias ls='ls -F --color=auto --group-directories-first'
alias ll='ls -F -al --color=auto --group-directories-first'

alias grep='grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn'

# Arch Linux aliases
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias pacfind='pacman -Ss'
alias pacflocal='pacman -Q'
alias pacinf='pacman -Qi'
alias pacrepi='pacman -Si'
