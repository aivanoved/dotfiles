source ~/.zplug/init.zsh

zplug "MichaelAquilina/zsh-you-should-use"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-history-substring-search"

zplug "zplug/zplug", hook-build:"zplug --self-manage"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose


