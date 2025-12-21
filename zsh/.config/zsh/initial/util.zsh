if [[ ${__INITIAL_UTIL__UTIL_FILE_SOURCE:-0} -eq 1 ]]; then
    return 0
fi

export __INITIAL_UTIL__UTIL_FILE_SOURCE=1

__INITIAL_UTIL__DEBUG=0
__INITIAL_UTIL__INFO=1
__INITIAL_UTIL__WARNING=2
__INITIAL_UTIL__ERROR=3

__INITIAL_UTIL__DEFAULT_LOG_VERBOCITY=$__INITIAL_UTIL__DEBUG
export __INITIAL_UTIL__UTIL_LOG_VERBOCITY="${__INITIAL_UTIL__UTIL_LOG_VERBOCITY:-$__INITIAL_UTIL__DEFAULT_LOG_VERBOCITY}"

__initial_util__log_format() {
    local log_level=$1
    local message=$2

    local log_prefix=""
    case $log_level in
        $__INITIAL_UTIL__DEBUG) log_prefix="DEBUG: " ;;
        $__INITIAL_UTIL__INFO) log_prefix="INFO: " ;;
        $__INITIAL_UTIL__WARNING) log_prefix="WARNING: " ;;
        $__INITIAL_UTIL__ERROR) log_prefix="ERROR: " ;;
        *) log_prefix="UNKNOWN: " ;;
    esac

    case $log_level in
        $__INITIAL_UTIL__DEBUG) log_prefix="\e[34m$log_prefix\e[0m" ;; # Blue
        $__INITIAL_UTIL__INFO) log_prefix="\e[32m$log_prefix\e[0m" ;;  # Green
        $__INITIAL_UTIL__WARNING) log_prefix="\e[33m$log_prefix\e[0m" ;; # Yellow
        $__INITIAL_UTIL__ERROR) log_prefix="\e[31m$log_prefix\e[0m" ;;  # Red
        *) log_prefix="\e[37m$log_prefix\e[0m" ;; # White
    esac

    local formatted_message="${log_prefix}${message}"

    echo "$formatted_message"
}

__initial_util__util_log() {
    local log_level="${__INITIAL_UTIL__UTIL_LOG_VERBOCITY:-$__INITIAL_UTIL__DEFAULT_LOG_VERBOCITY}"
    local level=$1
    local message=$2

    if [ $level -ge $log_level ]; then
        __initial_util__log_format $level "$message"
    fi

}

__initial_util__log_debug() { __initial_util__util_log $__INITIAL_UTIL__DEBUG "$1"; }
__initial_util__log_info() { __initial_util__util_log $__INITIAL_UTIL__INFO "$1"; }
__initial_util__log_warning() { __initial_util__util_log $__INITIAL_UTIL__WARNING "$1"; }
__initial_util__log_error() { __initial_util__util_log $__INITIAL_UTIL__ERROR "$1"; }

__initial_util__check_debug() { [[ ${__INITIAL_UTIL__UTIL_LOG_VERBOCITY:-$__INITIAL_UTIL__DEFAULT_LOG_VERBOCITY} -eq $__INITIAL_UTIL__DEBUG ]]; }
__initial_util__check_info() { [[ ${__INITIAL_UTIL__UTIL_LOG_VERBOCITY:-$__INITIAL_UTIL__DEFAULT_LOG_VERBOCITY} -le $__INITIAL_UTIL__INFO ]]; }
__initial_util__check_warning() { [[ ${__INITIAL_UTIL__UTIL_LOG_VERBOCITY:-$__INITIAL_UTIL__DEFAULT_LOG_VERBOCITY} -le $__INITIAL_UTIL__WARNING ]]; }
__initial_util__check_error() { [[ ${__INITIAL_UTIL__UTIL_LOG_VERBOCITY:-$__INITIAL_UTIL__DEFAULT_LOG_VERBOCITY} -le $__INITIAL_UTIL__ERROR ]]; }

__initial_util__set_log_verbocity() {
    local log_level=$1
    if [[ $log_level =~ ^[0-3]$ ]]; then
        export __INITIAL_UTIL__UTIL_LOG_VERBOCITY=$log_level
        __initial_util__log_debug "Log level set to $log_level"
    else
        __initial_util__log_warning "Invalid log level: $log_level. Must be between 0 and 3."
    fi
}

__initial_util__set_log_verbocity_debug() {
    __initial_util__set_log_verbocity $__INITIAL_UTIL__DEBUG
}

__initial_util__set_log_verbocity_info() {
    __initial_util__set_log_verbocity $__INITIAL_UTIL__INFO
}

__initial_util__set_log_verbocity_warning() {
    __initial_util__set_log_verbocity $__INITIAL_UTIL__WARNING
}

__initial_util__set_verbocity_error() {
    __initial_util__set_log_verbocity $__INITIAL_UTIL__ERROR
}

__initial_util__temporary_log_level() {
    local temp_level=$1
    local original_level=$__INITIAL_UTIL__UTIL_LOG_VERBOCITY
    __initial_util__set_log_verbocity $temp_level
    export _util_original_log_verbocity=$original_level
}

__initial_util__restore_log_level() {
    if [[ -n $_util_original_log_level ]]; then
        export __INITIAL_UTIL__UTIL_LOG_VERBOCITY=$_util_original_log_verbocity
        unset _util_original_log_verbocity
    else
        __initial_util__log_warning "No temporary log level set."
    fi
}

__initial_util__safe_source(){
    local output="$1"
    local to_source="$2"
    if [ -f $to_source ]; then
        __initial_util__log_info "Sourcing $to_source"
        source $to_source
        : ${(P)output::=1}
    else
        __initial_util__log_warning "File $to_source not found, not sourcing"
        : ${(P)output::=1}
    fi
}

function __initial_util__pastebin() {
    local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://paste.rs
    echo
}
