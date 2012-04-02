# Make sure nobody gets these settings by accident
if [ "$USER" = "wade" -o "$USER" = "Wade" ]; then
    export GIT_AUTHOR_NAME="Wade Simmons"
    export GIT_AUTHOR_EMAIL="wade@wades.im"
    export GIT_COMMITTER_NAME="Wade Simmons"
    export GIT_COMMITTER_EMAIL="wade@wades.im"
fi
