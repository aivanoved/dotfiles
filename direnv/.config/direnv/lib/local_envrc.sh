local_envrc_if_exists() {
    local envrc_local="${1:-$HOME/.envrc.local}"
    source_env_if_exists "$envrc_local"
}
