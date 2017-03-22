# vim:set ft=bash ts=2 sts=2 sw=2

set -x GOPATH $HOME/.go
set -x PATH $PATH \
            $HOME/.local/bin \
            $HOME/.go/bin/ \
            $HOME/bin \
            $HOME/.gem/ruby/2.4.0/bin \
            $HOME/.config/composer/vendor/bin \
            /usr/local/bin \
            /bin

function gl
  set -l query (commandline)

  if test -n $query
    set fzf_flags --query "$query"
  end

  ghq list -p | fzf $peco_flags | read line

  if [ $line ]
    cd $line
    commandline -f repaint
  end
end

function __fzf_history
  history | fzf-tmux -d40% +s +m --query=(commandline -b) \
    > /tmp/fzf
  and commandline (cat /tmp/fzf)
end

function g
  if [ "$argv" ]
    git $argv
  else
    git status
  end
end

function gup
  echo $PWD
  if [ $PWD = '/' ]
    return 1
  else if ls -a | grep -q '^.git$'
    return 0
  else
    cd ..
    gup
  end
end

# alias -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias 1='cd -'

alias bc='bc -l'
alias clp='xsel -o'
alias cl='xsel -i'
alias dc='docker-compose'
alias grep='grep --color=auto'
alias la='ls -A'
alias less='less -R'
alias ll='ls -al'
alias l='ls -CF'
alias ls='ls --color=auto'
alias now='date +%Y%m%d_%H%M%S'
alias seishin='cd (mktemp -d)'
alias tree='tree --charset XXX -I .git -I vendor -I node_modules'
alias wi='sudo wifi-menu'
alias wether='curl -s wttr.in | sed -n "1,7p"'
alias dp2off='xrandr --output DP2 --off'
alias dp2on='xrandr --output DP2 --above eDP1 --mode 1920x1080'

function mozc
    switch $argv
    case 'dict'
        /usr/lib/mozc/mozc_tool --mode=dictionary_tool
    case 'word'
        /usr/lib/mozc/mozc_tool --mode=word_register_dialog
    case 'config'
        /usr/lib/mozc/mozc_tool --mode=config_dialog
    case '*'
        echo 'mozc [dict|word|config]'
    end
end

source ~/.traimmu_dotfiles/aliases

function diffw
    colordiff -yW (tput cols) $argv
end

function diffc
    colordiff -U3 $argv
end

function git-open
    git remote -v | perl -pe 's/[ ]/\n/g' | head -1 | perl -pe 's;^.+:(.+)\.git;https://github.com/\1;g' | xargs chromium
end

function grg
    rg --heading --color always $argv | less
end

function nippo
    cd ~/.ghq/bitbucket.org/Kazuya-Gosho/mynote/mytasks/(date +%Y%m)
    set yesterday (ls | egrep '[0-9]+.md' | sort -n | tail -1)
    set today (date +%d).md
    cp $yesterday $today

    set yesterday_exp (date -d '1 days ago' +%Y/%m/%d)
    set today_exp (date +%Y/%m/%d)
    perl -i -pe "s;$yesterday_exp;$today_exp;" $today
    vim $today
end

function dot
    cd ~/.dotfiles
end

function replace
    git ls-files | xargs perl -i -pe "s/$argv[1]/$argv[2]/g"
end

pgrep xremap > /dev/null; or bash -c 'nohup xremap ~/.xremap 2>&1 >/dev/null &'
if pgrep tmux > /dev/null
    tmux a
else
    tmux
end


