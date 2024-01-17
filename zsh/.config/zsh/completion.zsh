fpath+="$ZDOTDIR/.zsh_functions"

autoload -Uz compinit bashcompinit

_comp_options+=(globdots)
zstyle ':completion:*' menu select
zmodload zsh/complist

compinit
bashcompinit
