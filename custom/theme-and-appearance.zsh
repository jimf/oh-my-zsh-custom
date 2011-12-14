source $HOME/.oh-my-zsh/lib/theme-and-appearance.zsh
unsetopt cdablevars
setopt NOCDABLEVARS

if [[ "$TERM" != "dumb" ]]; then
    if [[ "`uname`" = Darwin ]]; then
        unset LSCOLORS
        export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
    fi
fi

# Colorize manpages:
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
