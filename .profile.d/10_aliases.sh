# Define my commands alias or function


alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cl='xsel -ib'
alias clp='xsel -ob'
alias dc='docker-compose'
alias dce='docker-compose exec -it'
alias de='docker exec -it'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gita='git add -A . ; git commit -m "ALL Update" ; git push'
alias glook='cd $(ghq root)/$(ghq list | peco)'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias less='less -R'
alias ll='ls -al'
alias ls='ls --color=auto'
alias memo='emacs -nw ~/mynote/memo.org'
alias now='date +%Y%m%d_%H%M%S'
alias seishin-to-tokinoheya='cd $(mktemp -d)'
alias seishin='cd $(mktemp -d)'
alias sum="awk '{a+=\$1}END{print a}'"
alias tree='tree --charset XXX -I .git -I vendor'
alias winpath='source $HOME/bin/winpath'
alias ycal='cal `date +%Y`'

mozc(){
    case $1 in
        'dict') /usr/lib/mozc/mozc_tool --mode=dictionary_tool ;;
        'word') /usr/lib/mozc/mozc_tool --mode=word_register_dialog ;;
        'config') /usr/lib/mozc/mozc_tool --mode=config_dialog ;;
        *) echo 'mozc [dict|word|config]' ;;
    esac
}

alarm(){
    echo "tmux detach-client; sleep 1; cowsay_to_single_pts $1" | at $2
}

to_dos(){
    iconv -f utf8 -t sjis | perl -pe 's/\n/\r\n/' < /dev/stdin
}

mcd(){
   mkdir $1
   cd $1
}


