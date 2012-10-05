if [ $(uname) = 'Darwin' ]; then
    if [[ -n "$commands[gls]" ]]; then
        eval `gdircolors -b`
        alias ls='gls --color=auto'
    fi

    export JAVA_HOME=`/usr/libexec/java_home`

    if [[ -n "$commands[brew]" ]]; then
        if [[ -n "$commands[groovy]" ]]; then
            export GROOVY_HOME="$(brew --prefix groovy)/libexec"
        fi

        if [[ -n "$commands[go]" ]]; then
            path=($path "$(brew --prefix go)/bin")
        fi
    fi
fi
