xf
===
eXecutable Files (xf) was created to make it easier for software development teams
to write, run, and share commands and scripts specific to their individual projects.
Many commands are written and executed over the course of a development project. We have
scripts to build, test, deploy, analyze, the list goes on. These scripts are written in
different languages, use different platforms, and for the most part have very little
in common. Managing all of this is prone to error.

xf helps by giving one place to go to manage these commands and scripts and allows them
to be accessed from anywhere within the project.

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

        <command> options
            Run the specified command

        edit <command> [options]       
            Edit the specified command
            
            --use-history
                Appends the tail of ~/.bash_history to the
                command before editing.

        rm <command>         
            Remove the specified command

        show <commandname>
            Show the contents of the specified command

        ls                       
            List available commands

        xfiles                 
            Show location of .xfiles

QUICK REFERENCE
---------------

**init** is used to create a new xfiles project. This is typically done at the root of
your project repository.

	$ xf init

xf init creates a hidden directory named .xfiles that contains all of the project's
executable files.

	$ ls -la
	.xfiles

**xfiles** shows the path to the current .xfiles directory.

	$ xf xfiles
	/projects/xf_example/.xfiles

**edit** opens up the command in the editor specified by the environment variable $EDITOR.
If the command does not exist it will be created. Use edit to create new commands in
addition to editing existing ones. Use the --use-history flag to have xf append the tail
of ~/.bash\_history to your command file.

	$ xf edit example
	echo "Hello"
	echo "From xf!"

xf will move down the directory tree until it finds the root (which it identifies using a test for
dev/null) or a .xfiles directory. This behavior allows for xf commands to be executed from anywhere
within the project (above the .xfiles directory.)

	$ mkdir subdir
	$ cd subdir
	$ xf example
	Hello
	From xf

**ls** lists all of the available commands. A file exists in the .xfiles directory for each command listed
by ls.

	$ xf ls
	example

**rm** permanently removes a command.

	$ xf rm example
