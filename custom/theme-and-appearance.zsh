source $HOME/.oh-my-zsh/lib/$(basename $0)
unsetopt cdablevars
setopt NOCDABLEVARS
setopt nohup
setopt NO_beep

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

function theme_command_precmd {
    # Output sudo commands in red
    if [[ "${1[0,4]}" = sudo ]]; then
        echo -ne '\e[0;31m'
    # Prepend ack with a purple bar
    elif [[ "${1[0,3]}" = ack ]]; then
        echo -ne '\e[0;35m'
        printf "%$(tput cols)s\n"|tr ' ' '─'
        echo -ne '\e[0m'
    fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd theme_command_precmd
