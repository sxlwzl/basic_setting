
alias tmuxn='tmux new-session -s '
alias tmuxa='tmux attach-session -t '
alias tmuxk='tmux kill-session -t '

alias     c='cd ..;              '
alias    cc='cd ../../;          '
alias   ccc='cd ../../../;       '
alias  cccc='cd .../../../../;   '
alias ccccc='cd ../../../../../; '

alias     e='exit;exit;exit;exit;exit;'

function_cd() {
  cd $1; ls; pwd; 
};
alias cd=function_cd

function_mkd() {
  mkdir $1; cd $1; 
};
alias mkdir=function_mkd

alias gcsh="vim ~/.bashrc"
alias scsh="source ~/.bashrc"
alias gvrc="vim ~/.vimrc"
alias gtmux="vim ~/.tmux.conf"
