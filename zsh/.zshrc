export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

plugins=(
    git
    web-search
    1password
    asdf
    dirhistory
    copybuffer
    ag
    aliases
    alias-finder
    brew
    catimg
    colored-man-pages
    colorize
    command-not-found
    common-aliases
    copypath
    copyfile
    compleat
    dircycle

    dnote
    direnv
    docker
    emoji
    fasd
    fastfile
    fd
    fzf
    branch

    git-auto-fetch
    git-escape-magic
    git-extras
    gitignore
    helm
    iterm2
    minikube
    per-directory-history
    python
    rand-quote
    ripgrep
    rust
    taskwarrior
    terraform
    themes
    tmux

    tmux-cssh
    tmuxinator

    zsh-interactive-cd
)

source ~/.zplug/init.zsh

zplug 'MichaelAquilina/zsh-you-should-use'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'jeffreytse/zsh-vi-mode'
zplug 'zsh-users/zsh-history-substring-search'

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

source $ZSH/oh-my-zsh.sh

source "$HOME/.cargo/env"

neofetch

eval "$(op completion zsh)"; compdef _op op

eval "$(starship init zsh)"

alias :q='exit'
alias :e='$EDITOR'
alias :e\!='sudo $EDITOR'

export ZSHRC="$HOME/.zshrc"

alias :ve="$EDITOR $ZSHRC"
alias :vr="source $ZSHRC"

export VIMRC="$HOME/.vimrc"

alias :vevim="$EDITOR $VIMRC"

alias e="exa -lFh"

alias eS="exa -1FShs name"
alias ea="exa -lFh"
alias edot="exa -ld .*"
alias el="exa -l"
alias er="exa -tRFh"
alias esa="exa -lah"
alias esn="exa -1"
alias esr="exa -lRFh"
alias et="exa -lFht modified"

alias tmux='direnv exec / tmux'



_safe_source(){
    if [ -f $1 ]; then
        source $1
    fi
}

_safe_source ~/.zshenv

op whoami || eval $(op signin)
_safe_source ~/.zshsecretenv

ssh-add -l &> /dev/null

if [[ "$?" == 2 ]]; then

    test -r "~/.ssh-agent" && \
        eval "$(~/.ssh-agent)" > /dev/null

    ssh-add -l &> /dev/null

    if [[ "$?" == 2 ]]; then
        (umask 066; ssh-agent > ~/.ssh-agent)
        eval "$(~/.ssh-agent)" > /dev/null
    fi

fi

ssh-add -l &> /dev/null

if [[ "$?" == 1 ]]; then
    fd --exclude "*pub" . ~/.ssh/keys | xargs ssh-add
fi

_safe_source ~/.zshlocal

eval "$(gitconfig completion zsh)"; compdef _gitconfig gitconfig
eval "$(helm-cr completion zsh)"; compdef _cr helm-cr
eval "$(ct completion zsh)"; compdef _ct ct
eval "$(helm diff completion zsh)"; compdef _diff helm-diff

export REDO_HISTORY_PATH="$HOME/.zshhistory"
source "$(redo alias-file)"
bindkey -s '^e' 'redo^M'

bindkey jj vi-cmd-mode

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=(${ASDF_DIR}/completions $fpath)

autoload -U +X bashcompinit
compinit
bashcompinit

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
