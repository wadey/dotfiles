PROMPT='%{$fg_bold[red]%}%m%{$reset_color%} %$(($COLUMNS - 60))<..<%~%<<%{$fg_bold[yellow]%}$(git_prompt_info)%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})%#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[cyan]%}✗%{$fg_bold[yellow]%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[yellow]%}]"
