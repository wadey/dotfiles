# Make sure nobody gets these settings by accident
if [ "$USER" = "wade" -o "$USER" = "Wade" ]; then
    export GIT_AUTHOR_NAME="Wade Simmons"
    export GIT_AUTHOR_EMAIL="wade@wades.im"
    export GIT_COMMITTER_NAME="Wade Simmons"
    export GIT_COMMITTER_EMAIL="wade@wades.im"
fi

git_prompt_help() {
    echo "*     Unstaged files"
    echo "+     Staged files"
    echo "%     Untracked files"
    echo "$     Stashed files exist"
    echo "#     No HEAD (new repo)"
    echo
    echo "=     equal to upstream"
    echo ">     Ahead of upstream"
    echo "<     Behind upstream"
    echo "<>    Diverged from upstream"
}

source $ZSH_CUSTOM/git-prompt.sh
