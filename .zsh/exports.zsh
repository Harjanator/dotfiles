echo 'Load Exports'
export vscode_dir=/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin 
#export PATH=/home/guru/.local/bin:$vscode_dir:$PATH
export VISUAL="nano"
export EDITOR="nano"
[[ -f /usr/local/bin/ansible-playbook ]] || [[ -f ~/.local/bin/ansible-playbook ]] && export ANSIBLE_CONFIG=/gurulandia/ansible/config/ansible.cfg
[[ -f /usr/local/bin/sops ]] && export SOPS_AGE_KEY_FILE=~/.sops/age.key
