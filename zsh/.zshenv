typeset -U path

path=(/usr/local/bin $path)
path=(~/.local/bin $path)

export EDITOR=vim
export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

. "$HOME/.cargo/env"
path=($HOME/git-fuzzy/bin $path)
