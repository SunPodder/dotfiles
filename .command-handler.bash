_set_hist(){
    # $PREFIX/tmp/corrected_command_history file not exist, return
    [ ! -f $PREFIX/tmp/corrected_command_history ] && return
    
    # if second line is not 1
    # remove previous command from history
    if [ $(sed -n '2p' $PREFIX/tmp/corrected_command_history) != 1 ]; then
        history -d -1
    fi

    # read 1st line from $PREFIX/tmp/corrected_command_history and add to history
    history -s $(head -n 1 $PREFIX/tmp/corrected_command_history | xargs)

    # remove history temp file
    rm $PREFIX/tmp/corrected_command_history
}

# run _set_hist after every command
PROMPT_COMMAND="_set_hist; $PROMPT_COMMAND"


command_not_found_handle(){

    # check if ~/.cache/path-to-cmd-not-found file exist
    # else get path to commamd-not-found executable with locate
    # and save to ~/.cache/path-to-cmd-not-found
    if [ ! -f ~/.cache/path-to-cmd-not-found ]; then
        locate command-not-found | head -n 1 > ~/.cache/path-to-cmd-not-found
    fi

    # get path to command-not-found executable
    cmd_not_found=$(cat ~/.cache/path-to-cmd-not-found)

    # get output from command_not_found into a variable
    local output=$($cmd_not_found "$1" 2>&1)

    # if the output is empty, then the command was found
    if [ -z "$output" ]; then
        echo "Command not found: $1"
        return 0
    fi

    if [[ "$output" != No\ command\ $1\ found* ]]; then
        echo "$output"
        return 0
    fi

    # list all the commands
    local commands=$(echo "$output" | grep -oP "(?<=Command )[a-zA-Z0-9]*")

    # convert the commands into an array
    local commands_array=($commands)


    # keep listening for key press
    local index=0
    local command=${commands_array[$index]}
    
    while true; do
        echo -en "Did you mean \e[36m$command\e[0m? [Y/n] "
        read -s -n 1 key
        echo

        # if the user presses enter|y|Y, then run the current command
        # if the user presses n|N, then exit
        if [ "$key" = "" ] || [ "$key" = "y" ] || [ "$key" = "Y" ]; then
            wrong_command=$1
            shift
            echo -e "\e[33mRunning:\e[0m $command $@"
            
            # write the command to $PREFIX/tmp/corrected_command_history
            echo "$command $@" > $PREFIX/tmp/corrected_command_history

            # if last command is same as wrong command
            # append 1 to the file
            if [ "$(history 1 | cut -c 8-)" = "$(echo $wrong_command | xargs)" ]; then
                echo 1 >> $PREFIX/tmp/corrected_command_history
            fi



            $command "$@"
            return 0
        elif [ "$key" = "n" ] || [ "$key" = "N" ]; then
            echo "Command not found: $1"
            return 0
        fi

        # cycle through commands on arrow key presses
        if [ "$key" = $'\x1b' ]; then
            read -s -n 2 key
            if [ "$key" = "[A" ]; then
                index=$((index - 1))
            elif [ "$key" = "[B" ]; then
                index=$((index + 1))
            fi

            # if the index is out of bounds, then loop around
            if [ $index -lt 0 ]; then
                index=$((index + ${#commands_array[@]}))
            elif [ $index -ge ${#commands_array[@]} ]; then
                index=$((index - ${#commands_array[@]}))
            fi

            command=${commands_array[$index]}
        fi
        
        # overwrite the previous prompt
        echo -ne "\e[1A\e[K"

    done


}
