CMD
===

Manage and run bash scripts from anywhere in your project.

USAGE
-----

	Usage: cmd options

    OPTIONS:
   		--help, -h            Show this message
   		--version, -v         Show version
   		init                  Initialize cmd project
   		<commandname>         Run the specified command
   		edit <commandname>    Edit the specified command
   		rm <commandname>      Remove the specified command
   		ls                    List available commands
	   	cmdfiles              Show location of cmdfiles


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

INSTALLATION
------------

	$ git clone git://github.com/bytecollective/cmd.git
	$ cd cmd
	$ make install