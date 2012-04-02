if [ $(uname) = 'Darwin' ]; then
    if [[ -n "$commands[gls]" ]]; then
        eval `gdircolors -b`
        alias ls='gls --color=auto'
    fi

    export JAVA_HOME=`/usr/libexec/java_home`
fi
