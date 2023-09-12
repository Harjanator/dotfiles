# Load Aliases
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh

# Load  Goto
[[ -f ~/.zsh/goto.zsh ]] && source ~/.zsh/goto.zsh

# Execute neofetch
[[ -f /usr/bin/neofetch && -f ~/.config/neofetch/gl.txt ]] && neofetch --ascii ~/.config/neofetch/gl.txt

