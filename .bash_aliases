alias k=kubectl
alias kl="kubectl --kubeconfig=/mnt/c/develop/kubeconfig_lab01.yml"
alias ko="kubectl --kubeconfig=/mnt/c/develop/kubeconfig_ops01.yml"
alias token="kubectl create token dashboard -n default"
alias useops="kubectl config use ops02-markus"
alias uselab="kubectl config use lab02-admin"
alias useopsa="kubectl config use ops02-admin"
alias gcon="kubectl config get-contexts"
alias ccon="kubectl config current-context"
alias pullall='/mnt/c/Users/Markus/Documents/pull_all.sh'
alias pushall='/mnt/c/Users/Markus/Documents/push_all.sh'
alias cdd='cd /mnt/c/develop'
alias cds='cd /mnt/c/develop/space'
alias cdl='cd /mnt/c/develop/space/leasone'
alias cdi='cd /mnt/c/develop/space/infrastructure'
alias cdw='cd /mnt/c/develop/space/wiki'
alias cdp='cd /mnt/c/develop/privat'
alias cdsu='cd /mnt/c/Users/Markus/AppData/Roaming/"Sublime Text"/Packages/User'
alias cdn='cd ~/.config/nvim/lua/papierkorp/'
alias cdt='cd /mnt/c/develop/tmp'
alias cdc='cd /mnt/c/develop/privat/dotfiles/home'
alias gitbash='/mnt/c/Program\ Files/Git/bin/bash.exe'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
psql() {
    kubectl exec -it "$1" -n "$2" -- /opt/bitnami/scripts/postgresql/entrypoint.sh /bin/bash
}
alias vi='nvim'
