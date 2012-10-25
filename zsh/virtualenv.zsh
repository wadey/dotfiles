if [[ -n "$commands[virtualenvwrapper_lazy.sh]" ]]; then
    export WORKON_HOME=~/.virtualenvs
    export PROJECT_HOME=~/src
    mkdir -p $WORKON_HOME
    source =virtualenvwrapper_lazy.sh
fi
