echo 'Load Functions'
# Easily extract archives
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.tar.xz)    tar xvf $1    ;;
      *.bz2)       bzip2 -d $1    ;;
      *.rar)       unrar2dir $1    ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip2dir $1     ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1    ;;
      *.ace)       unace x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

compress() {
    if [[ -n "$1" ]]; then
        FILE=$1
        case $FILE in
            *.tar ) shift && tar cf $FILE $* ;;
            *.tar.bz2 ) shift && tar cjf $FILE $* ;;
            *.tar.gz ) shift && tar czf $FILE $* ;;
            *.tgz ) shift && tar czf $FILE $* ;;
            *.zip ) shift && zip $FILE $* ;;
            *.rar ) shift && rar $FILE $* ;;
        esac
    else
        echo "usage: compress <foo.tar.gz> ./foo ./bar"
    fi
}

mkcdr () { 
    mkdir -p "$@" && cd "$@"
}

top10() {
    history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head;
}

myip() {
    local ip=$(curl -s http://ifconfig.me/ip)
    echo $ip
}

#netinfo - shows network information for your system
netinfo () {
    echo "--------------- Network Information ---------------"
#    /sbin/ifconfig | awk /'inet addr/ {print $2}'
#    /sbin/ifconfig | awk /'Bcast/ {print $3}'
#    /sbin/ifconfig | awk /'inet addr/ {print $4}'
#    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
#    echo "${myip()}"
    /sbin/ifconfig | awk /'inet / {print $2, $3, $4, $5, $6}'
    /sbin/ifconfig | awk /'ether/ {print $2}'
    myip
    echo "---------------------------------------------------"
}

showpkg () {
    apt-cache pkgnames | grep -i "$1" | sort
    return;
}

#install(){
#  sudo apt-get install -y $1
#}

uninstall(){
  sudo apt-get remove --purge -y $1
}

run_under_tmux() {
    # Run $1 under session or attach if such session already exist.
    # $2 is optional path, if no specified, will use $1 from $PATH.
    # If you need to pass extra variables, use $2 for it as in example below..
    # Example usage:
    #   torrent() { run_under_tmux 'rtorrent' '/usr/local/rtorrent-git/bin/rtorrent'; }
    #   mutt() { run_under_tmux 'mutt'; }
    #   irc() { run_under_tmux 'irssi' "TERM='screen' command irssi"; }


    # There is a bug in linux's libevent...
    # export EVENT_NOEPOLL=1

    command -v tmux >/dev/null 2>&1 || return 1

    if [ -z "$1" ]; then return 1; fi
        local name="$1"
    if [ -n "$2" ]; then
        local execute="$2"
    else
        local execute="command ${name}"
    fi

    if tmux has-session -t "${name}" 2>/dev/null; then
        tmux attach -d -t "${name}"
    else
        tmux new-session -s "${name}" "${execute}" \; set-option status \; set set-titles-string "${name} (tmux@${HOST})"
    fi
}

reload () {
    exec "${SHELL}" "$@"
}

confirm() {
    local answer
    echo -ne "zsh: sure you want to run '${YELLOW}$*${NC}' [yN]? "
    read -q answer
        echo
    if [[ "${answer}" =~ ^[Yy]$ ]]; then
        command "${@}"
    else
        return 1
    fi
}

confirm_wrapper() {
    if [ "$1" = '--root' ]; then
        local as_root='true'
        shift
    fi

    local prefix=''

    if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi
    confirm ${prefix} "$@"
}

poweroff() { confirm_wrapper --root $0 "$@"; }
reboot() { confirm_wrapper --root $0 "$@"; }
hibernate() { confirm_wrapper --root $0 "$@"; }

#startx() {
#    exec =startx
#}

begin_with() {
    local string="${1}"
    shift
    local element=''
    for element in "$@"; do
        if [[ "${string}" =~ "^${element}" ]]; then
            return 0
        fi
    done
    return 1

}

termtitle() {
    case "$TERM" in
        rxvt*|xterm*|nxterm|gnome|screen|screen-*)
            local prompt_host="${(%):-%m}"
            local prompt_user="${(%):-%n}"
            local prompt_char="${(%):-%~}"
            case "$1" in
                precmd)
                    printf '\e]0;%s@%s: %s\a' "${prompt_user}" "${prompt_host}" "${prompt_char}"
                ;;
                preexec)
                    printf '\e]0;%s [%s@%s: %s]\a' "$2" "${prompt_user}" "${prompt_host}" "${prompt_char}"
                ;;
            esac
        ;;
    esac
}

dot_progress() {
    # Fancy progress function from Landley's Aboriginal Linux.
    # Useful for long rm, tar and such.
    # Usage:
    #     rm -rfv /foo | dot_progress
    local i='0'
    local line=''

    while read line; do
        i="$((i+1))"
        if [ "${i}" = '25' ]; then
            printf '.'
            i='0'
        fi
    done
    printf '\n'
}

# Fix backgrounding of GUI apps
#precmd_disown() {
#  emulate -L zsh
#  setopt extendedglob
#  local job match mbegin mend

#  jobs | while read job; do
#    if [[ $job = \[(#b)([[:digit:]]##)\]*running* ]]; then
#      disown %$match[1]
#    fi
#  done
#}

#autoload -U add-zsh-hook
#add-zsh-hook precmd precmd_disown
