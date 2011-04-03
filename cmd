#!/bin/bash

VERSION_NUMBER=0.0.1

usage() {
cat << EOF
Usage: $0 options

OPTIONS:
   --help, -h            Show this message
   --version, -v         Show version
   init                  Initialize cmd project
   <commandname>         Run the specified command
   edit <commandname>    Edit the specified command
   rm <commandname>      Remove the specified command
   ls                    List available commands
   cmdfiles              Show location of cmdfiles
EOF
}

CMD_FILES=.

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

if [[ $1 = "init" ]]
then
    mkdir cmdfiles
elif [[ $1 = "--help" ]] || [[ $1 = "-h" ]]
then
    usage
elif [[ $1 = "--version" ]] || [[ $1 = "-v" ]]
then
    echo "CMD v$VERSION_NUMBER"
else
    set_cmd_files
    if [[ $1 = "edit" ]]
    then
        # a commandname must be given
        if [[ -z "$2" ]] ; then exit_no_cmd_specified ; fi

        # if the command doesn't exist create it
        if [[ ! -a $CMD_FILES/$2 ]]
        then
            touch $CMD_FILES/$2
        fi

        # the $EDITOR environment variable must be specified 
        if [[ -z "$EDITOR" ]]
        then
            echo "ERROR: Set the \$EDITOR environment variable to your preferred text editor"
            exit 1 # can't edit the cmd
        fi

        $EDITOR $CMD_FILES/$2
    elif [[ $1 = "rm" ]]
    then
        # a commandname must be given
        if [[ -z "$2" ]] ; then exit_no_cmd_specified ; fi
        rm $CMD_FILES/$2
    elif [[ $1 = "ls" ]]
    then
        ls $CMD_FILES
    elif [[ $1 = "cmdfiles" ]]
    then
        cd $CMD_FILES
        pwd
    else
        # if no arguments were given, print usage
        if [[ -z "$1" ]]
        then
            usage
            exit 1
        fi
        if [[ ! -a $CMD_FILES/$1 ]]
        then
            echo "ERROR: No such command"
            exit 1 # no command to run
        fi
        bash $CMD_FILES/$1
    fi
fi

exit 0
