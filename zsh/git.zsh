# Make sure nobody gets these settings by accident
if [ "$USER" = "wade" -o "$USER" = "Wade" ]; then
    export GIT_AUTHOR_NAME="Wade Simmons"
    export GIT_AUTHOR_EMAIL="wade@wades.im"
    export GIT_COMMITTER_NAME="Wade Simmons"
    export GIT_COMMITTER_EMAIL="wade@wades.im"
fi

GIT_PS1_SHOWDIRTYSTATE=${GIT_PS1_SHOWDIRTYSTATE:-1}
GIT_PS1_SHOWSTASHSTATE=${GIT_PS1_SHOWSTASHSTATE:-1}
GIT_PS1_SHOWUNTRACKEDFILES=${GIT_PS1_SHOWUNTRACKEDFILES:-1}
GIT_PS1_SHOWUPSTREAM=${GIT_PS1_SHOWUPSTREAM:-auto}

__git_prompt() {
  __git_ps1 "[%s]" | sed 's/%/%%/g'
}

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


source $ZSH_CUSTOM/git-completion.bash
