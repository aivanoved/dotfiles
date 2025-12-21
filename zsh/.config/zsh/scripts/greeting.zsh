 __scripts_greeting__greeting() {
    local message="Today is the best day"
    if command -v fortune &> /dev/null; then
        message="$(fortune)"
    fi
    if command -v cowsay &> /dev/null; then
        message="$(cowsay $message)"
    fi
    if command -v lolcat &> /dev/null; then
        echo $message | lolcat
        echo
        echo
    else
        echo $message
        echo
        echo
    fi

    if command -v fastfetch &> /dev/null; then
        fastfetch
    fi
}
