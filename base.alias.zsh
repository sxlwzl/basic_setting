alias vzsh=" vim ~/.zshrc"
alias szsh=" source ~/.zshrc"
alias vtmuxc=" vim ~/.tmux.conf"
alias vvimrc=" vim ~/.vimrc"

alias tmux="/router/bin/tmux"
tmuxn() { /router/bin/tmux new-session -s    $1 ; }
tmuxa() { /router/bin/tmux attach-session -t $1 ; }
tmuxk() { /router/bin/tmux kill-session -t   $1 ; }

alias h='history'
alias his="history"

alias ls='ls --color=tty'
alias ll='ls -l --color=tty'
alias la='ls -al --color=tty'

cd() { builtin cd $1; ls; echo $PWD; }
alias c='cd ../; '
alias cc='cd ../../; '
alias ccc='cd ../../../; '
alias cccc='cd ../../../../; '
alias ccccc='cd ../../../../../; '

# mkdir() { mkdir $1; cd $1; };
mkd() { mkdir $1; cd $1; };

alias e='exit;exit;exit;exit;exit;exit'
