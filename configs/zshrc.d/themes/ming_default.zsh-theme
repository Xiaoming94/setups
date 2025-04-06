# Default prompt configuration Including with VCS info
# Sets Foreground color differently depending on the state of working directory

# autoloading VCS info from zshcontrib
autoload -Uz vcs_info

# Constructing the prompt
precmd () {
    vcs_info

    G_STATUS=$(command git status --porcelain 2> /dev/null | tail -n 1)
    zstyle ':vcs_info:*' actionformats \
            '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '

    if [[ -n $G_STATUS ]]; then
        zstyle ':vcs_info:*' formats \
                '%F{5}(%B%f%s%F{5}%%b)%F{3}:%F{5}[%B%F{9}%b%F{5}%%b]%f '
    else
        zstyle ':vcs_info:*' formats \
                '%F{5}(%B%f%s%F{5}%%b)%F{3}:%F{5}[%B%F{2}%b%F{5}%%b]%f '
    fi

    zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
}

PROMPT='[%B%n%F{10}@%F{9}%m%f%b](%B%F{4}%2~%f%b) ${vcs_info_msg_0_}%f\$ '
