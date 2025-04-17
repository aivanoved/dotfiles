_source_util

if [ ! command -v op &> /dev/null ]; then
    _log_warning "1Password CLI is not installed. Please install it to use this script."
    return 1
fi

# export GITHUB_TOKEN=$(op read op://Personal/github/token)
