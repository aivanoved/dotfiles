source <(fzf --zsh)

if [ -n "${TMUX}" ]; then
    export FZF_DEFAULT_OPTS='--tmux bottom --layout reverse --border top'
fi
