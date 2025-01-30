[[ -f ~/.zsh/gurulandia.zsh ]] && source ~/.zsh/gurulandia.zsh

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

c