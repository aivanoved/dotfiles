typeset -U path

path=(/usr/local/bin $path)
path=(~/.local/bin $path)

export EDITOR=vim

. "$HOME/.cargo/env"
path=($HOME/git-fuzzy/bin $path)
