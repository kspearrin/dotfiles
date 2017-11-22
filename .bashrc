# for f in ~/.profile.d/[0-9]*.sh
# do
#     source "$f"
# done
for f in ~/.bash/[0-9]*.sh
do
    source "$f"
done

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
