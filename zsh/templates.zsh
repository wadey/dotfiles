TDIR="$ZSH_CUSTOM/templates"

function template() {
    if [[ ! $# = 1 ]]; then
        ls $TDIR
    elif [[ -e "$1" ]]; then
        echo "$1 already exists" 2>&1
        return 2
    else
        echo "> $1"
        cat "$TDIR/$1" >$1
    fi
}
