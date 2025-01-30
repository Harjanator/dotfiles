echo 'Load Plgins'

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit load zsh-users/zsh-history-substring-search
zinit ice wait atload '_history_substring_search_config'
zinit light agkozak/zsh-z

if [ -f /usr/bin/python3 ] ; then
	[[ ! -f /usr/bin/python ]] && sudo apt install -y python-is-python3
	zinit wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv
fi
