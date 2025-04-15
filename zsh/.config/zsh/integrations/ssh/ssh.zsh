eval `ssh-agent -s`

ssh-add -l &> /dev/null

if [[ "$?" == 2 ]]; then

    test -r "~/.ssh-agent" && \
        eval "$(~/.ssh-agent)" > /dev/null

    ssh-add -l &> /dev/null

    if [[ "$?" == 2 ]]; then
        (umask 066; ssh-agent > $HOME/.ssh-agent)
        eval "$(~/.ssh-agent)" > /dev/null
    fi

fi

ssh-add -l &> /dev/null

if [[ "$?" == 1 ]]; then
    fd --exclude "*pub" . ~/.ssh/keys | xargs ssh-add
fi
