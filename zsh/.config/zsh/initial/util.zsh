if [[ ${_UTIL_FILE_SOURCE:-0} -eq 1 ]]; then
    return 0
fi

export _UTIL_FILE_SOURCE=1

_DEBUG=0
_INFO=1
_WARNING=2
_ERROR=3

_DEFAULT_LOG_VERBOCITY=$_ERROR
export _UTIL_LOG_VERBOCITY="${_UTIL_LOG_VERBOCITY:-$_DEFAULT_LOG_VERBOCITY}"

_log_format() {
    local log_level=$1
    local message=$2

    local log_prefix=""
    case $log_level in
        $_DEBUG) log_prefix="DEBUG: " ;;
        $_INFO) log_prefix="INFO: " ;;
        $_WARNING) log_prefix="WARNING: " ;;
        $_ERROR) log_prefix="ERROR: " ;;
        *) log_prefix="UNKNOWN: " ;;
    esac

    case $log_level in
        $_DEBUG) log_prefix="\e[34m$log_prefix\e[0m" ;; # Blue
        $_INFO) log_prefix="\e[32m$log_prefix\e[0m" ;;  # Green
        $_WARNING) log_prefix="\e[33m$log_prefix\e[0m" ;; # Yellow
        $_ERROR) log_prefix="\e[31m$log_prefix\e[0m" ;;  # Red
        *) log_prefix="\e[37m$log_prefix\e[0m" ;; # White
    esac

    local formatted_message="${log_prefix}${message}"

    echo "$formatted_message"
}

_util_log() {
    local log_level="${_UTIL_LOG_VERBOCITY:-$_DEFAULT_LOG_VERBOCITY}"
    local level=$1
    local message=$2

    if [ $level -ge $log_level ]; then
        _log_format $level "$message"
    fi

}

_log_debug() {
    local message=$1
    _util_log $_DEBUG "$message"
}

_log_info() {
    local message=$1
    _util_log $_INFO "$message"
}

_log_warning() {
    local message=$1
    _util_log $_WARNING "$message"
}

_log_error() {
    local message=$1
    _util_log $_ERROR "$message"
}

_set_log_level() {
    local log_level=$1
    if [[ $log_level =~ ^[0-3]$ ]]; then
        export _UTIL_LOG_VERBOCITY=$log_level
        _log_debug "Log level set to $log_level"
    else
        _log_warning "Invalid log level: $log_level. Must be between 0 and 3."
    fi
}

_temporary_log_level() {
    local temp_level=$1
    local original_level=$_UTIL_LOG_VERBOCITY
    _set_log_level $temp_level
    export _util_original_log_verbocity=$original_level
}

_restore_log_level() {
    if [[ -n $_util_original_log_level ]]; then
        export _UTIL_LOG_VERBOCITY=$_util_original_log_verbocity
        unset _util_original_log_verbocity
    else
        _log_warning "No temporary log level set."
    fi
}

_safe_source(){
    if [ -f $1 ]; then
        _log_info "Sourcing $1"
        source $1
    else
        _log_warning "File $1 not found, not sourcing"
    fi
}
