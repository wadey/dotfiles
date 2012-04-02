# http://www.jukie.net/bart/blog/screen-ssh-agent
_ssh_auth_save() {
    mkdir -p "$HOME/.screen"
    ln -sf "$SSH_AUTH_SOCK" "$HOME/.screen/ssh-auth-sock.$HOST"
}
alias screen='_ssh_auth_save && HOST="$HOST" screen'
