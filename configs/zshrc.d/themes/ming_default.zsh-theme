# Default prompt configuration Including with VCS info

# autoloading VCS info from zshcontrib
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats \
        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
        '%F{5}(%B%f%s%F{5}%%b)%F{3}:%F{5}[%B%F{2}%b%F{5}%%b]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

PS1='[%B%n%F{10}@%F{9}%m%f%b](%B%F{4}%2~%f%b) ${vcs_info_msg_0_}%f\$ '
