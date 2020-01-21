# dmenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dmenu.c util.c
OBJ = $(SRC:.c=.o)

all: options pinentry-dmenu-core

options:
	@echo dmenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

pinentry-dmenu-core: dmenu.o drw.o util.o
	$(CC) -o $@ dmenu.o drw.o util.o $(LDFLAGS)

clean:
	rm -f pinentry-dmenu-core $(OBJ) pinentry-dmenu-$(VERSION).tar.gz

dist: clean
	mkdir -p pinentry-dmenu-$(VERSION)
	cp LICENSE Makefile README.md arg.h config.def.h pinentry-dmenu config.mk\
		drw.h util.h $(SRC)\
		pinentry-dmenu-$(VERSION)
	tar -cf pinentry-dmenu-$(VERSION).tar pinentry-dmenu-$(VERSION)
	gzip pinentry-dmenu-$(VERSION).tar
	rm -rf pinentry-dmenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f pinentry-dmenu-core pinentry-dmenu $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/pinentry-dmenu-core
	chmod 755 $(DESTDIR)$(PREFIX)/bin/pinentry-dmenu

pinentry-install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	sed 's#pinentry-dmenu-core#dmenu#g' < pinentry-dmenu > $(DESTDIR)$(PREFIX)/bin/pinentry-dmenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/pinentry-dmenu

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/pinentry-dmenu-core
	rm -f $(DESTDIR)$(PREFIX)/bin/pinentry-dmenu

pinentry-uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/pinentry-dmenu

.PHONY: all options clean dist install uninstall pinentry-install pinentry-uninstall
