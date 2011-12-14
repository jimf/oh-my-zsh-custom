## Command history configuration
if [ -n "$SSH_TTY" ]; then
    HISTFILE="$HOME/.zshhist_${USER}_${HOST}"
else
    HISTFILE="$HOME/.zshhist"
fi
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups # ignore duplication command history list

setopt hist_verify
setopt inc_append_history
setopt extended_history #?
setopt hist_expire_dups_first
setopt hist_ignore_space

setopt APPEND_HISTORY


## My other history
#setopt NO_hist_allow_clobber
#setopt NO_hist_beep
#setopt hist_find_no_dups
#setopt hist_ignore_all_dups
#setopt hist_no_functions
#setopt hist_no_store
#setopt hist_reduce_blanks
#setopt hist_save_no_dups
#setopt append_history
