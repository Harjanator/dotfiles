echo 'Load Snippets'
# Add in snippets
if [ -f /usr/bin/git ] ; then
	zinit snippet OMZL::git.zsh && zinit snippet OMZP::git
	# zinit snippet OMZ::plugins/git/git.plugin.zsh
fi
zinit snippet OMZP::common-aliases
zinit snippet OMZP::copyfile
zinit snippet OMZP::copypath
zinit snippet OMZP::extract
zinit snippet OMZP::encode64
zinit snippet OMZP::command-not-found
zinit snippet OMZP::systemd
zinit snippet OMZP::systemadmin

zinit snippet OMZP::aliases
if [ ! -f ~/.local/share/zinit/snippets/OMZP::aliases/cheatsheet.py ]; then
 	cd  ~/.local/share/zinit/snippets/OMZP::aliases
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/aliases/cheatsheet.py 
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/aliases/termcolor.py
	cd ~
fi

[[ -f /usr/bin/sudo  ]] && zinit snippet OMZP::sudo

# Ansible
if [ -f /usr/local/bin/ansible-playbook ] || [ -f ~/.local/bin/ansible-playbook ]; then
	zinit snippet OMZP::ansible
fi

# Docker
if [ -f /usr/bin/docker ] ; then
	if [ ! -f "~/.cache/zinit/completions/_docker" ]; then
		mkdir -p ~/.cache/zinit/completions && touch ~/.cache/zinit/completions/_docker
	fi
	zinit snippet OMZP::docker && zinit snippet OMZP::docker-compose
fi

# Debian
distro=$(lsb_release -a | awk /'Distributor / {print $3}')
if [ ${distro} = "Debian" ]; then
	# echo $distro
	apt_pref='apt'
	apt_upgr='full-upgrade'
	zinit snippet OMZP::debian
fi

[[ -f /usr/bin/ufw ]] && zinit snippet OMZP::ufw
[[ -f /usr/bin/tmux ]] && zinit snippet OMZP::tmux
[[ -f /usr/bin/pip ]] && zinit snippet OMZP::pip


#zinit snippet OMZP::helm
#zinit snippet OMZP::vscode
#zinit snippet OMZP::brew
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
#zinit snippet OMZP::miocrok8s
#zinit snippet OMZP::ssh
#zinit snippet OMZP::terraform
#zinit snippet OMZP::vagrant
#zinit snippet OMZP::gh
#zinit snippet OMZP::genpass
