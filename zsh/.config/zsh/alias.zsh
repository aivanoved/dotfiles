source "$ZSH_CONFIG_DIR/util.zsh"

alias :q='exit'

_safe_source "$ZSH_CONFIG_DIR/alias/alias_editor.zsh"
_safe_source "$ZSH_CONFIG_DIR/alias/alias_eza.zsh"
_safe_source "$ZSH_CONFIG_DIR/alias/alias_cd.zsh"

_safe_source "$ZSH_CONFIG_DIR/alias/alias_git.zsh"
_safe_source "$ZSH_CONFIG_DIR/alias/alias_tmux.zsh"

alias valias="source $ZSH_CONFIG_DIR/alias.zsh"


alias ven="source $ZSH_CONFIG_DIR/env.zsh"
alias t='task'
