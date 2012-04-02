# iTerm2 tab color commands
# http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-red() { tab-color 255 0 0 }
tab-green() { tab-color 0 255 0 }
tab-blue() { tab-color 0 0 255 }
tab-reset() { echo -ne "\033]6;1;bg;*;default\a" }

tab-exec() {
    trap "tab-reset" EXIT INT
    $1
    shift
    $*
}
color-ssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        if [[ "$*" =~ "production|ec2-.*compute-1" ]]; then
            tab-color 255 0 0
        else
            tab-color 0 255 0
        fi
    fi
    ssh $*
}
compdef _ssh color-ssh=ssh
alias ssh=color-ssh
