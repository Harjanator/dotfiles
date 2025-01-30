# Check Prequisites
[[ -f ~/.zsh/prequisites.zsh ]] && source ~/.zsh/prequisites.zsh

# [[ -f ~/.zsh/gurulandia.zsh ]] && source ~/.zsh/gurulandia.zsh

# Set the directory we want to store zinit and plugins
#ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
#if [ ! -d "$ZINIT_HOME" ]; then
#   mkdir -p "$(dirname $ZINIT_HOME)"
#   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
#fi

# Source/Load zinit
#source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# Add in snippets
if [ -f /usr/bin/git ] ; then
	zinit snippet OMZL::git.zsh && zinit snippet OMZP::git
fi
if [ -f /usr/bin/sudo ] ; then
	zinit snippet OMZP::sudo
fi
if [ -f /usr/local/bin/ansible-playbook ] || [ -f ~/.local/bin/ansible-playbook ]; then
	zinit snippet OMZP::ansible
fi
if [ -f /usr/bin/docker ] ; then
	if [ ! -f "~/.cache/zinit/completions/_docker" ]; then
		mkdir -p ~/.cache/zinit/completions && touch ~/.cache/zinit/completions/_docker
	fi
	zinit snippet OMZP::docker && zinit snippet OMZP::docker-compose
fi

#zinit snippet OMZP::helm
apt_pref='apt'
apt_upgr='full-upgrade'
zinit snippet OMZP::debian
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
zinit snippet OMZP::aliases
#zinit snippet OMZP::systemd
#zinit snippet OMZP::ufw
#zinit snippet OMZP::miocrok8s
#zinit snippet OMZP::ssh
#zinit snippet OMZP::terraform
#zinit snippet OMZP::tmux
#zinit snippet OMZP::vagrant
#zinit snippet OMZP::gh
#zinit snippet OMZP::genpass
#zinit snippet OMZP::pip
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
#eval "$(oh-my-posh init zsh)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls -al --color'
#alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
