_safe_source(){
    if [ -f $1 ]; then
        source $1
    fi
}
