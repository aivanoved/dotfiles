local -i __INTEGRATIONS_1PASSWORD_ENV__SOURCED_UTIL=0
__zshrc__source_util __INTEGRATIONS_1PASSWORD_ENV__SOURCED_UTIL

if [ ! command -v op &> /dev/null ]; then
    local message="1Password CLI is not installed. Please install it to use this script."
    if [[ $__INTEGRATIONS_1PASSWORD_ENV__SOURCED_UTIL -eq 1 ]]; then
        __initial_util__log_warning "$message"
    else
        echo "$message"
    fi
    return 1
fi
