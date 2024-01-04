source "$ZSH_CONFIG_DIR/util.zsh"

alias :q='exit'

_safe_source "$ZSH_CONFIG_DIR/alias_editor.zsh"
_safe_source "$ZSH_CONFIG_DIR/alias_exa.zsh"
_safe_source "$ZSH_CONFIG_DIR/alias_cd.zsh"

_safe_source "$ZSH_CONFIG_DIR/alias_git.zsh"

alias tmux='direnv exec / tmux'
alias t='task'
