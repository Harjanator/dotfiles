echo 'Load Aliases'
# Command aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias back='cd $OLDPWD'
alias c='clear'
alias cls="clear"
alias copy="cp"
alias cp='cp -iv'
alias del='rm'
alias df='df -h -x squashfs -x tmpfs -x devtmpfs'
alias go="goto"
alias ls='ls -lhF --color=auto --human-readable --time-style=long-iso --classify'
#alias ls='ls -al --color'
alias move="mv"
alias ports='netstat -tulanp'
alias rm='rm -iv'
alias seditor='sudo editor'
alias snano='sudo editor'
alias os-release='lsb_release -a'

# Safetynets
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Package management
#if [ -f /usr/bin/apt ]; then
#  alias update='sudo apt update'
#  alias upgrade='sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt clean'
#  alias install='sudo apt install'
#  alias remove='sudo apt purge'
#fi

#alias gurulandia="nano ~/.gurulandia"
alias known_hosts='editor ~/.ssh/known_hosts'
#alias reload='source ~/zsh/gurulandia.zsh'

# Ansible
if [ -f /usr/local/bin/ansible-playbook ] || [ -f ~/.local/bin/ansible-playbook ]; then
  echo 'Setting Ansible Aliases'
  alias ansible-playbook-local='ansible-playbook --connection=local 127.0.0.1 '
  alias upgrade-ansible='pip install --upgrade ansible'
  alias ansibleconfig="nano $ANSIBLE_CONFIG"
  alias ansiblehosts="nano /gurulandia/ansible/hosts/hosts.yaml"
  alias update-host="ansible-playbook /gurulandia/ansible/playbooks/update.yaml --limit $1"
  alias update-localnames="ansible-playbook /gurulandia/ansible/playbooks/update-unbound-local-names.yaml"
  alias update-pihole="ansible-playbook /gurulandia/ansible/playbooks/update-pihole.yaml"
fi

# Sops
if [ -f /usr/local/bin/sops ]; then
  echo 'Setting sops Aliases'
  alias sops-encrypt-yaml="sops -e -a $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") --encrypted-regex '^(data|stringData)$' -i "
  alias sops-decrypt-yaml="sops -d -a $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") --encrypted-regex '^(data|stringData)$' -i "
  alias sops-encrypt="sops -e -a $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") -i "
  alias sops-decrypt="sops -d -a $(cat $SOPS_AGE_KEY_FILE |grep -oP "public key: \K(.*)") -i "
fi
