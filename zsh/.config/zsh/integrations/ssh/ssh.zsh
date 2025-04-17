agent_file="$HOME/.ssh-agent"

load_agent() {
    if [[ -r $agent_file]]; then
        eval "$(<$agent_file)" &> /dev/null
    fi
}

store_agent() {
    if [[ -r $agent_file ]]; then
        rm -f $agent_file &> /dev/null
    fi
    (umask 066; ssh-agent > $agent_file) &> /dev/null
}

agent_not_running() {
    ssh-add -l &> /dev/null
    [[ $? -eq 2 ]]
}

agent_no_identities() {
    ssh-add -l &> /dev/null
    [[ $? -eq 0 ]]
}

start_ssh_agent() {
    eval "$(ssh-agent -s)" &> /dev/null

    if agent_not_running; then
        store_agent
        load_agent
    fi
}

add_ssh_keys() {
    if agent_no_identities; then
        find "$HOME/.ssh/keys" -type f ! -name "*.pub" -exec ssh-add {} + &> /dev/null
    fi

    store_agent
    load_agent
}

start_ssh_agent
add_ssh_keys
