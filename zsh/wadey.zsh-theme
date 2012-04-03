GIT_PS1_SHOWDIRTYSTATE=${GIT_PS1_SHOWDIRTYSTATE:-1}
GIT_PS1_SHOWSTASHSTATE=${GIT_PS1_SHOWSTASHSTATE:-1}
GIT_PS1_SHOWUNTRACKEDFILES=${GIT_PS1_SHOWUNTRACKEDFILES:-1}
GIT_PS1_SHOWUPSTREAM=${GIT_PS1_SHOWUPSTREAM:-auto}

if [[ -z "$functions[__git_ps1]" ]]; then
    echo "ERROR: wadey.zsh-theme requires git-completions.bash to be sourced"
fi

__git_prompt() {
  __git_ps1 "[%s]" | sed 's/%/%%/g'
}

PROMPT='%{$fg_bold[red]%}%m%{$reset_color%} %$(($COLUMNS - 60))<..<%~%<<%{$fg_bold[yellow]%}$(__git_prompt)%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})%#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[cyan]%}✗%{$fg_bold[yellow]%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[yellow]%}]"
