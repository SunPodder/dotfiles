export PS2="..."
export PS4="> "


EMOJI(){
printf "\U$(printf '%x' $((RANDOM%79+128512)))$1"
}

COLOR(){
echo "\[$(tput setaf $1)\]"
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}



export USERNAME="Sun"
export HOSTNAME="Termux"


PS1="\n$(COLOR 11)┌─────($USERNAME@$HOSTNAME) $(COLOR 1)[$(COLOR 2)\w$(COLOR 1)]\[\033[35m\]\$(parse_git_branch) $(COLOR 115)\@\n$(COLOR 11)└─$(COLOR 15)\$(EMOJI)\[\e[0;97m\]\[$(tput sgr0)\] \$ "
