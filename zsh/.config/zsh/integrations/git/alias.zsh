# based on https://github.com/ohmyzsh/ohmyzsh/blob/ec74eb91bda8ee0cb42f4b9697d13154e31a93d6/plugins/git/git.plugin.zsh
# licensed under MIT
# see license in omz_LICENSE

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gav='git add --verbose'
alias gco='git checkout'
alias gc='git commit --verbose'

alias gd='git diff'

alias glg='git log --stat'
alias gm='git merge'
alias gl='git pull'



alias gp='git push'
alias grb='git rebase'
alias grh='git reset'
alias gru='git reset --'
alias grhh='git reset --hard'




alias gpu='git push -u origin $(git branch --show-current)'

alias grs='git restore'
alias grst='git restore --staged'
alias grm='git rm'
alias gst='git status'

# depends on correct git config

alias grt='git root'
