_safe_source(){
    if [ -f $1 ]; then
        source $1
    fi
}

_util_log() {
    local log_level=${ZSH_LOAD_VERBOSITY:-0}
    local message=$1

    if [ $log_level -gt 0 ]; then
        echo "$message"
    fi

}
