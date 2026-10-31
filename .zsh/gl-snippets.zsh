echo 'Add in snippets'
# Add in snippets
zinit snippet OMZP::eza
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::ansible
if [ ! -f "~/.cache/zinit/completions/_docker" ]; then
	mkdir -p ~/.cache/zinit/completions
	touch ~/.cache/zinit/completions/_docker
fi
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
#zinit snippet OMZP::helm
#zinit snippet OMZP::debian
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
#zinit snippet OMZP::aliases
#zinit snippet OMZP::systemd
#zinit snippet OMZP::ufw
#zinit snippet OMZP::miocrok8s
zinit snippet OMZP::sops
#zinit snippet OMZP::ssh
#zinit snippet OMZP::terraform
zinit snippet OMZP::tmux
#zinit snippet OMZP::vagrant
#zinit snippet OMZP::gh
#zinit snippet OMZP::genpass
#zinit snippet OMZP::pip
zinit snippet OMZP::brew
zinit snippet OMZP::dotenv
#zinit snippet OMZP::dotnet
