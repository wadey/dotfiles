if [ $(uname) = 'Darwin' ]; then
    if [[ -n "$commands[gls]" ]]; then
        eval `gdircolors -b`
        alias ls='gls --color=auto'
    fi

    function java8() {
        export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    }
    function java7() {
        export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
    }
    function java6() {
        export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
    }

    java8

    if [[ -n "$commands[brew]" ]]; then
        if [[ -n "$commands[groovy]" ]]; then
            export GROOVY_HOME="$(brew --prefix groovy)/libexec"
        fi

        if [[ -n "$commands[go]" ]]; then
            path=($path "$(brew --prefix go)/bin")
        fi

        if [[ -n "$commands[npm]" ]]; then
            path=($path /usr/local/share/npm/bin)
        fi
    fi
fi
