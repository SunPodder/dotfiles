
#clear && fortune | cowsay | lolcat
clear

shopt -s cdspell
shopt -s autocd

CDPATH=(/sdcard)

py(){
    killall -2 python
    python -m http.server $1
}

PHP(){
    killall -2 php
    if [[ -z "$1" ]]; then
        php -S 127.0.0.1:1234
    else
        php -S 127.0.0.1:$1
    fi
}

alias c=clear

gh-size(){
    # extract repo "user/repo" from the given url with grep 
    name=$(echo $1 | grep -oP '(?<=github.com/)[^/]+/[^/]+')

    size=$(curl -s https://api.github.com/repos/$name | grep -oP '(?<="size": )[^,]+' | numfmt --to=iec --from-unit=1024)

    echo -e "\033[34m$name:\033[31m $size"
}


mkcd(){
    mkdir $1
    cd $1
}

cd(){
    builtin cd $@
    export PATH="$PWD:$BASE_PATH"
}



alias rm="rm -rf"

export PIP_DEFAULT_TIMEOUT=100
export DISPLAY=":1"


source ~/.ps.sh
source ~/.command-handler.bash
source ~/.completions



BASE_PATH="~/perl5/bin:/data/data/com.termux/files/usr/bin:~/.ngrok2:~/.cloudflared:~/.composer/vendor/bin:~/go/bin:~/.cargo/bin:$PREFIX/opt/emscripten"

export PATH="$BASE_PATH"


alias lx="$PREFIX/bin/ls"
alias ls="exa --icons"
alias la="ls -a"
alias ll="ls -l"

alias vnc="vncserver -geometry 1460x920"
vnckill(){
    "kill $(cat ~/.vnc/localhost:1.pid)"
}


export PERL5LIB="~/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="~/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"~/perl5\""
export PERL_MM_OPT="INSTALL_BASE=~/perl5"
