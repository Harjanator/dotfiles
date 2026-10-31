if [ ! -d "/etc/nixos" ]; then
	if [ ! -f "${HOME}/.zsh/.installed" ]; then
		source ${HOME}/.zsh/install.zsh
	else
		source ${HOME}/.zsh/init-brew.zsh
	fi

	apt_pref='apt'
	apt_upgr='full-upgrade'
fi

[[ -f ~/.zsh/gl-zinit.zsh ]] && source ~/.zsh/gl-zinit.zsh # Load zinit
[[ -f ~/.zsh/setopt.zsh ]] && source ~/.zsh/setopt.zsh # setopt
[[ -f ~/.zsh/gl-prompt.zsh ]] && source ~/.zsh/gl-prompt.zsh # Set Prompt
[[ -f ~/.zsh/gl-bindkey.zsh ]] && source ~/.zsh/gl-bindkey.zsh # Load Bindkey
[[ -f ~/.zsh/history.zsh ]] && source ~/.zsh/history.zsh # Load History
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh # Load Aliases
if [ ! -d "/etc/nixos" ]; then
	[[ -f ~/.zsh/gl-integrations.zsh ]] && source ~/.zsh/gl-integrations.zsh # Load Integrations
	fi
fi


#[[ -f ~/.zsh/plugins.zsh ]] && source ~/.zsh/plugins.zsh # Plugins
#[[ -f ~/.zsh/snippets.zsh ]] && source ~/.zsh/snippets.zsh # Snippets

#[[ -f ~/.zsh/exports.zsh ]] && source ~/.zsh/exports.zsh # Load Exports


#[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh # Load Functions
#[[ -f ~/.zsh/mounts.zsh ]] && source ~/.zsh/mounts.zsh # Load Mounts
#[[ -f ~/.zsh/path.zsh ]] && source ~/.zsh/path.zsh # Set Path
#[[ -f ~/.zsh/theming.zsh ]] && source ~/.zsh/theming.zsh # Set theming

#[[ -f ./goto.zsh ]] && source ./goto.zsh # Load Goto

# Execute neofetch
#[[ -f /usr/bin/neofetch && -f ~/.config/neofetch/gl.txt ]] && neofetch --ascii ~/.config/neofetch/gl.txt
