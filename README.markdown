CMD
===
Manage and run cli scripts from anywhere in your project.

INSTALLATION
------------
    $ git clone git://github.com/bytecollective/cmd.git
	$ cd cmd
	$ make install
	$ cmd --help

USAGE
-----
Usage: cmd command [args]

COMMANDS:
    --help, -h               
        Show this message

    --version, -v            
        Show version

    init <path>              
        Initialize cmd project. Uses current working 
        directory if no path is given.

    <commandname>
        Run the specified command

    edit <commandname> [options]       
        Edit the specified command
        
        --use-history, -uh      
            Appends the tail of ~/.bash_history to the
            command before editing.

    rm <commandname>         
        Remove the specified command

    ls                       
        List available commands

    cmdfiles                 
        Show location of cmdfiles

QUICK EXAMPLE
-------------
	$ cmd init
	$ ls
	cmdfiles
	$ cmd cmdfiles
	/projects/cmd_example/cmdfiles
	$ cmd edit example
	echo "Hello"
	echo "From CMD!"
	$ mkdir subdir
	$ cd subdir
	$ cmd ls
	example
	$ cmd example
	Hello
	From CMD
	$ cmd rm example
