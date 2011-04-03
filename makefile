install:
	# create a symlink of cmd in users 
	# bin folder
	ln -s $(CURDIR)/cmd /usr/local/bin/cmd

uninstall:
	# remove symlink
	rm /usr/local/bin/cmd
