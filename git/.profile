alias g='git'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gdog='git dog'
alias glog='git l'
alias glogme='glog --author="<$(git config user.email)>"'
function gradd(){
	: ${1?"please supply the github username"}
	git remote add "$1" "git@github.com:$1/universe.git"
}
