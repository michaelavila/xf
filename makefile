install:
	# create a symlink of xf in users 
	# bin folder
	ln -s $(CURDIR)/xf /usr/local/bin/xf

uninstall:
	# remove symlink
	rm /usr/local/bin/xf
