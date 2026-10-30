if [ ! -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
	echo "Install HomeBrew"
	/bin/bash -c "$(curl -fsSL http://192.168.5.30:53006/Gurulandia/Homelab/raw/branch/main/setup/homebrew_install.sh)"
    echo "HomeBrew installed" > ${HOME}/.zsh/.installed
fi

source ${HOME}/.zsh/init-brew.zsh

if [ ! -f "/home/linuxbrew/.linuxbrew/bin/fzf" ]; then
	echo "Install fzf"
	brew install fzf
    echo "fzf installed" >> ${HOME}/.zsh/.installed
fi

if [ ! -f "/home/linuxbrew/.linuxbrew/bin/zoxide" ]; then
	echo "Install zoxide"
	brew install zoxide
    echo "zoxide installed" >> ${HOME}/.zsh/.installed
fi

if [ ! -f "/home/linuxbrew/.linuxbrew/bin/oh-my-posh" ]; then
	echo "Install oh-my-posh"
	brew install jandedobbeleer/oh-my-posh/oh-my-posh
    echo "oh-my-posh installed" >> ${HOME}/.zsh/.installed
fi
