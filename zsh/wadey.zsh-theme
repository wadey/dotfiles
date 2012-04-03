GIT_PS1_SHOWDIRTYSTATE=${GIT_PS1_SHOWDIRTYSTATE:-1}
GIT_PS1_SHOWSTASHSTATE=${GIT_PS1_SHOWSTASHSTATE:-1}
GIT_PS1_SHOWUNTRACKEDFILES=${GIT_PS1_SHOWUNTRACKEDFILES:-1}
GIT_PS1_SHOWUPSTREAM=${GIT_PS1_SHOWUPSTREAM:-auto}

WADEY_COLOR=${WADEY_COLOR:-"%B%F{red}"}

if [[ -z "$functions[__git_ps1]" ]]; then
    echo "ERROR: wadey.zsh-theme requires git-completions.bash to be sourced"
fi

__git_prompt() {
  __git_ps1 "[%s]" | sed 's/%/%%/g'
}

PROMPT='%B$WADEY_COLOR%m%f%b %$(($COLUMNS - 60))<..<%~%<<%B%F{yellow}$(__git_prompt)%(?.%F{green}.%F{red})%#%f%b '
