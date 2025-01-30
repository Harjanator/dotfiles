if [ ! -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
	echo "Install HomeBrew"
	/bin/bash -c "$(curl -fsSL http://192.168.5.30:53006/Gurulandia/Homelab/raw/branch/main/setup/homebrew_install.sh)"
fi
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
