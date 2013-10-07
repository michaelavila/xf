xf
===
eXecutable Files (xf) was created to make it easier for software development teams
to write, run, and share commands and scripts specific to their individual projects.
Many commands are written and executed over the course of a development project. We have
scripts to build, test, deploy, analyze, the list goes on. These scripts are written in
different languages, use different platforms, and for the most part have very little
in common. Managing all of this is prone to error.

xf helps you to find and execute these scripts from anywhere within the project.

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
    Usage: xf

    COMMANDS:
      --help, -h               
        Show this message

      --version, -v            
        Show version

      init <path>              
        Initialize cmd project. Uses current working 
        directory if no path is given.

      ls                       
        List available commands

      <command> [options]
        Run the specified command

QUICK REFERENCE
---------------

**init** is used to create a new xfiles project. This is typically done at the root of
your project repository.

    $ xf init

xf init creates a hidden file named .xf

**ls** lists all of the available commands. All executable files within the
whole project will be listed.

    $ xf ls
    example

**command** executes the command. If multiple commands with the provided name
exist then the user is prompted to select which one to run.

    $ xf foo
    ...
