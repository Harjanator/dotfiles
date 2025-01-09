[[ -f ~/.zsh/exports.zsh ]] && source ~/.zsh/exports.zsh # Load Exports
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh # Load Aliases
[[ -f ~/.zsh/bindkey.zsh ]] && source ~/.zsh/bindkey.zsh # Load Bindkey
[[ -f ~/.zsh/completion.zsh ]] && source ~/.zsh/completion.zsh # Load Completion
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh # Load Functions
[[ -f ~/.zsh/history.zsh ]] && source ~/.zsh/history.zsh # Load History
[[ -f ~/.zsh/mounts.zsh ]] && source ~/.zsh/mounts.zsh # Load Mounts
[[ -f ~/.zsh/path.zsh ]] && source ~/.zsh/path.zsh # Set Path
[[ -f ~/.zsh/plugins.zsh ]] && source ~/.zsh/plugins.zsh # Plugins
[[ -f ~/.zsh/prompt.zsh ]] && source ~/.zsh/prompt.zsh # Set Prompt
[[ -f ~/.zsh/setopt.zsh ]] && source ~/.zsh/setopt.zsh # setopt
[[ -f ~/.zsh/theming.zsh ]] && source ~/.zsh/theming.zsh # Set theming

[[ -f ./goto.zsh ]] && source ./goto.zsh # Load Goto

# Execute neofetch
[[ -f /usr/bin/neofetch && -f ~/.config/neofetch/gl.txt ]] && neofetch --ascii ~/.config/neofetch/gl.txt
