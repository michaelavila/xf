#!/bin/bash

VERSION_NUMBER=0.0.1
declare -a RESERVED_WORDS=('--help' '-h' '--version' '-v' 'init' 'edit' 'rm' 'ls' 'cmdfiles')
CMD_FILES=.

usage() {
cat << EOF
Usage: $0 command [args]

OPTIONS:
   --help, -h            Show this message
   --version, -v         Show version
   init <path>           Initialize cmd project.
                         Uses current working directory
                         if no path is given.
   <commandname>         Run the specified command
   edit <commandname>    Edit the specified command
   rm <commandname>      Remove the specified command
   ls                    List available commands
   cmdfiles              Show location of cmdfiles
EOF
}

set_cmd_files() {
    while [[ ! -a cmdfiles ]]
    do
        cd ..
        # using dev/null because it always? exists at root
        # need to find a better way of identifying root directory
        if [[ -a dev/null ]]
        then
            echo "ERROR: No cmdfiles found"
            exit 1 # no cmd files found
        fi
    done
    CMD_FILES=./cmdfiles
}

exit_no_cmd_specified() {
    echo "ERROR: No command name specified"
    usage
    exit 1 # can't rm a file that isn't specified
}

exit_reserved_word() {
    echo "ERROR: '$1' is a reserved word and cannot be used as a cmd name"
    exit 1 # can't create the cmd because the cmdname is a reserved word
}

exit_no_such_cmd() {
    echo "ERROR: No such command"
    exit 1 # no command to run
}

if [[ $1 = "--help" ]] || [[ $1 = "-h" ]]
then
    usage
    exit 0
elif [[ $1 = "--version" ]] || [[ $1 = "-v" ]]
then
    echo "CMD v$VERSION_NUMBER"
    exit 0
elif [[ $1 = "init" ]]
then
    # use specified path if it exists
    if [[ -z "$2" ]]
    then 
        PROJECT_PATH=.
    else
        PROJECT_PATH=$2
    fi

    mkdir $PROJECT_PATH/cmdfiles
    exit 0
else
    set_cmd_files
    if [[ $1 = "edit" ]]
    then
        # a commandname must be given
        if [[ -z "$2" ]] ; then exit_no_cmd_specified ; fi

        # command name can not be a reserved name
        for reserved_word in ${RESERVED_WORDS[@]}
        do
            if [[ $reserved_word = $2 ]]
            then
                exit_reserved_word $2
            fi
        done

        # if the command doesn't exist create it
        if [[ ! -a $CMD_FILES/$2 ]]
        then
            touch $CMD_FILES/$2
            chmod +x $CMD_FILES/$2
        fi

        # if the tail history flag was set, append the bash
        # history to the end of the command
        if [[ $3 = "-h" ]]
        then
            tail ~/.bash_history >> $CMD_FILES/$2
        fi

        # the $EDITOR environment variable must be specified 
        if [[ -z "$EDITOR" ]]
        then
            echo "ERROR: Set the \$EDITOR environment variable to your preferred text editor"
            exit 1 # can't edit the cmd
        fi

        $EDITOR $CMD_FILES/$2
        exit 0
    elif [[ $1 = "rm" ]]
    then
        # a commandname must be given
        if [[ -z "$2" ]] ; then exit_no_cmd_specified ; fi
        # check if command exists
        if [[ ! -a $CMD_FILES/$2 ]] ; then exit_no_such_cmd ; fi

        rm $CMD_FILES/$2
        exit 0
    elif [[ $1 = "ls" ]]
    then
        ls $CMD_FILES
        exit 0
    elif [[ $1 = "cmdfiles" ]]
    then
        cd $CMD_FILES
        pwd
        exit 0
    else
        # if no arguments were given, print usage
        if [[ -z "$1" ]]
        then
            usage
            exit 1
        fi

        # check if command exists
        if [[ ! -a $CMD_FILES/$1 ]] ; then exit_no_such_cmd ; fi

        # run command
        $CMD_FILES/$1
        exit 0
    fi
fi
