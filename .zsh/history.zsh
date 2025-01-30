echo 'Set history settings'

HISTFILE=~/.zsh_history # Where to save history to disk
HISTSIZE=1000 # How many lines of history to keep in memory
SAVEHIST="${HISTSIZE}" # Number of history entries to save to disk
HISTDUP=erase # Erase duplicates in the history file

# Enable history search with up and down arrows
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

#bindkey '^p' history-search-backward
#bindkey '^n' history-search-forward

setopt inc_append_history # All terminal sessions append to the history file immediately as commands are entered
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_all_dups # When a duplicate command is entered, remove the oldest duplicate
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt appendhistory # If this is set, zsh sessions will append their history list to the history file, rather than replace it.
setopt sharehistory # Share history across terminals

# Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space.
setopt hist_ignore_space

setopt hist_save_no_dups # When writing out the history file, older commands that duplicate newer ones are omitted.
setopt hist_ignore_dups # Do not enter command lines into the history list if they are duplicates of the previous event.

# When searching for history entries in the line editor, do not display duplicates of a line previously found, even if the duplicates are not contiguous.
setopt hist_find_no_dups