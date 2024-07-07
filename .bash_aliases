alias k=kubectl
alias kl="kubectl --kubeconfig=/mnt/c/develop/kubeconfig_lab01.yml"
alias ko="kubectl --kubeconfig=/mnt/c/develop/kubeconfig_ops01.yml"
alias token="kubectl create token dashboard -n default"
alias useops="kubectl config use ops02-markus"
alias uselab="kubectl config use lab02-admin"
alias useopsa="kubectl config use ops02-admin"
alias gcon="kubectl config get-contexts"
alias ccon="kubectl config current-context"
alias pullall='/mnt/c/Users/Markus/pull_all.sh'
alias pushall='/mnt/c/Users/Markus/push_all.sh'
alias pulldot='/mnt/c/Users/Markus/pull_dot.sh'
alias pushdot='/mnt/c/Users/Markus/push_dot.sh'
alias cdd='cd /mnt/c/develop'
alias cdg='cd /mnt/c/develop/gitlab'
alias cdl='cd /mnt/c/develop/gitlab/leasone'
alias cdi='cd /mnt/c/develop/gitlab/infrastructure'
alias cdw='cd /mnt/c/develop/gitlab/wiki'
alias cdp='cd /mnt/c/develop/privat'
alias cdsu='cd /mnt/c/Users/Markus/AppData/Roaming/"Sublime Text"/Packages/User'
alias cdn='cd ~/.config/nvim/lua/papierkorp/'
alias cdt='cd /mnt/c/develop/tmp'
alias cdc='cd /mnt/c/develop/privat/dotfiles/home'
alias cdh='cd /mnt/c/Users/Markus'
alias cdssh='cd /mnt/c/develop/sirconic/todo/ssh'
alias gitbash='/mnt/c/Program\ Files/Git/bin/bash.exe'
alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfw='/usr/bin/git --git-dir=/mnt/c/Users/Markus/.dotfiles --work-tree=/mnt/c/Users/Markus'
alias hosts='gsudo vi /mnt/c/Windows/System32/drivers/etc/hosts'
alias gitalias="gsudo vi /mnt/c/'Program Files'/Git/etc/profile.d/aliases.sh"
alias cbranch="git branch --show-current"
alias gitconfig="git config -l --show-scope --show-origin"
psql() {
    kubectl exec -it "$1-postgresql-0" -n "$1" -- /opt/bitnami/scripts/postgresql/entrypoint.sh /bin/bash
}
alias vi='nvim'
export KUBECONFIG=$(find /mnt/c/develop -maxdepth 1 -type f -name 'kubeconfig*' | sed ':a;N;s/\n/:/;ba')
# export GOPATH=/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/cng
