DESTDIR      = /usr/local
INSTALL_BIN  = $(DESTDIR)/bin
INSTALL_CONF = $(DESTDIR)/share

all:
	make readwrite dtest tcaltest dtest readgps rndpkt

readwrite: readwrite.c
	gcc -Wall -o readwrite readwrite.c

tcaltest: tcaltest.c 
	gcc -Wall -o tcaltest tcaltest.c

dtest: dtest.c
	gcc -Wall -lcurses -o dtest dtest.c

readgps: readgps.c
	gcc -Wall -o readgps readgps.c

rndpkt: rndpkt.c
	gcc -Wall -o rndpkt rndpkt.c

rpm:
	./dorpm `cat moat-version`

install: 
	install moat-version   $(INSTALL_CONF)
	install readwrite      $(INSTALL_BIN)
	install dtest          $(INSTALL_BIN)
	install tcaltest       $(INSTALL_BIN)
	install readgps        $(INSTALL_BIN)
	install echo-loop      $(INSTALL_BIN)
	install rndpkt         $(INSTALL_BIN)
	install watchcomms     $(INSTALL_BIN)
	install moat           $(INSTALL_BIN)
	install moat14         $(INSTALL_BIN)
	install shortmoat      $(INSTALL_BIN)
	install stagedtests.pl $(INSTALL_BIN)
	install se.pl          $(INSTALL_BIN)
	install sb.pl          $(INSTALL_BIN)
	install anamoat        $(INSTALL_BIN)
	install quadtool       $(INSTALL_BIN)

clean:
	rm -f *~ readwrite dtest tcaltest dtest readgps rndpkt
