setopt prompt_subst
autoload -U colors && colors
autoload -U is-at-least

# Inspired by http://briancarper.net/blog/570/git-info-in-your-zsh-prompt
if is-at-least 4.3.6; then
    autoload -U add-zsh-hook
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' stagedstr '%F{green}✚'
    zstyle ':vcs_info:*' unstagedstr '%F{yellow}⚡'
    zstyle ':vcs_info:*' check-for-changes true
    if builtin which -s git &>/dev/null; then
        zstyle ':vcs_info:*' enable git
    fi

    function jimf_precmd {
        if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
            zstyle ':vcs_info:*' formats '[%F{magenta}%b%c%u%F{black}]%F{reset}'
        } else {
            zstyle ':vcs_info:*' formats '[%F{magenta}%b%c%u%F{red}●%F{black}]%F{reset}'
        }

        vcs_info
    }
    add-zsh-hook precmd jimf_precmd
fi

function spwd {
    if [[ $PWD == $HOME* ]]; then
        local spwd_="~${PWD#$HOME}"
    else
        local spwd_="$PWD"
    fi

    echo $spwd_ | sed 's%.*/\([^/]*/[^/]*/[^/]*\)$%➤ \1%'
}

# Define prompt.
function set_prompt() {
    local name=""
    local host=""

    if [ "`id -u`" -eq 0 ]; then
        name="%{$fg_bold[red]%}root"
        ZSH_THEME_PRIV="%{$fg_bold[red]%}%#%{${reset_color}%}"
    else
        ZSH_THEME_PRIV="%{${reset_color}%}%#"
    fi

    if [ "$SSH_TTY" ] || [[ "`tty`" = /dev/pts/* ]]; then
        if [[ "$SERVERTYPE" == critical ]]; then
            host="%{$fg_bold[red]%}%m%{${reset_color}%}: "
        else
            host="%{$fg_bold[magenta]%}%m%{${reset_color}%}: "
        fi
    fi

    if [ -n "$name" ] && [ -n "$host" ]; then
        host="%{$fg_bold[magenta]%}@$host"
    fi

    ZSH_THEME_TIME="%{$fg_bold[yellow]%}%D{%H:%M}%{$fg[black]%}"
    ZSH_THEME_WHOAMI="${name}${host}"
    ZSH_THEME_PWD="%{$fg[green]%}"'$(spwd)'"%{$fg[black]%}"

    PROMPT='${ZSH_THEME_TIME} (${ZSH_THEME_WHOAMI}'${ZSH_THEME_PWD}')${vcs_info_msg_0_}${ZSH_THEME_PRIV} '
}

set_prompt
