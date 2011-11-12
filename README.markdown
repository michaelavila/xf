xf
===
Manage and run cli scripts from anywhere in your project.

INSTALLATION
------------
    $ git clone git://github.com/bytecollective/xf.git
	$ cd xf
	$ make install
	$ xf --help

GETTING THIS CRAP OFF OF YOUR COMPUTER
--------------------------------------
    $ cd /path/to/xf/source
    $ make uninstall

USAGE
-----
    Usage: xf command [args]

    COMMANDS:
        --help, -h               
            Show this message

        --version, -v            
            Show version

        init <path>              
            Initialize xf project. Uses current working 
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

        xffiles                 
            Show location of xffiles

QUICK EXAMPLE
-------------
	$ xf init
	$ ls
	xffiles
	$ xf xffiles
	/projects/xf_example/xffiles
	$ xf edit example
	echo "Hello"
	echo "From xf!"
	$ mkdir subdir
	$ cd subdir
	$ xf ls
	example
	$ xf example
	Hello
	From xf
	$ xf rm example
