install:
	# create a symlink of xf in users 
	# bin folder
	ln -s $(CURDIR)/xf /usr/local/bin/xf

uninstall:
	# remove symlink
	rm /usr/local/bin/xf

bin/xf: src/xf.c src/help.h src/help.c
	mkdir -p bin
	gcc src/xf.c src/help.c src/help.h -o bin/xf
