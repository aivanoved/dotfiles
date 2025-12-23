source $HOME/.zplug/init.zsh

zplug "MichaelAquilina/zsh-you-should-use"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-history-substring-search"
# zplug romkatv/powerlevel10k, as:theme, depth:1
# zplug "tolkonepiu/catppuccin-powerlevel10k-themes"

zplug "zplug/zplug", hook-build:"zplug --self-manage"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


local -i __INTEGRATIONS_ZPLUG__UTIL_SOURCED=0
__zshrc__source_util __INTEGRATIONS_ZPLUG__UTIL_SOURCED

local verbose=""
if [[ $__INTEGRATIONS_ZPLUG__UTIL_SOURCED -eq 1 ]] && __initial_util__check_info; then
    verbose="--verbose"
fi

zplug load $verbose
