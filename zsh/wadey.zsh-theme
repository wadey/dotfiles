GIT_PS1_SHOWDIRTYSTATE=${GIT_PS1_SHOWDIRTYSTATE:-1}
GIT_PS1_SHOWSTASHSTATE=${GIT_PS1_SHOWSTASHSTATE:-1}
GIT_PS1_SHOWUNTRACKEDFILES=${GIT_PS1_SHOWUNTRACKEDFILES:-1}
GIT_PS1_SHOWUPSTREAM=${GIT_PS1_SHOWUPSTREAM:-auto}

local WADEY_COLOR=${WADEY_COLOR:-"%B%F{red}"}
local WADEY_HOST=${WADEY_HOST:-"$WADEY_COLOR%m"}

if [ $USER = wade ]; then
    local WADEY_USER=""
else
    local WADEY_USER="$USER@"
fi

if [[ -z "$functions[__git_ps1]" ]]; then
    echo "ERROR: wadey.zsh-theme requires git-completions.bash to be sourced"
fi

__git_prompt() {
  __git_ps1 "[%s]"
}

PROMPT='$WADEY_USER%B$WADEY_HOST%f%b %$(($COLUMNS - 60))<..<%~%<<%B%F{yellow}$(__git_prompt)%(?.%F{green}.%F{red})%#%f%b '
