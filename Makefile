CC ?= cc
SOURCES = $(wildcard src/*.c)
PKGCONFIG = $(shell which pkg-config)
CFLAGS = -Wno-deprecated-declarations -g $(shell $(PKGCONFIG) --cflags gtk+-3.0 gthread-2.0 gstreamer-video-1.0 libcanberra alsa)
LIBS = $(shell $(PKGCONFIG) --libs gtk+-3.0 gthread-2.0 gstreamer-video-1.0 libcanberra alsa) -lm
PACKAGE = camoramic

all: ${PACKAGE} po/tr_TR/$(PACKAGE).mo

camoramic: $(SOURCES)
	$(CC) $(^) -o ${PACKAGE} ${CFLAGS} ${LIBS}

po/tr_TR/$(PACKAGE).mo: po/tr_TR/$(PACKAGE).po
	msgfmt $(^) --output-file=$@ 
	
clean:
	rm -f ${PACKAGE}
	rm -f po/tr_TR/$(PACKAGE).mo

uninstall:
	rm -f /usr/local/bin/camoramic
	rm -f /usr/share/glib-2.0/schemas/org.tga.camoramic.gschema.xml
	rm -f /usr/share/locale/tr_TR/LC_MESSAGES/$(PACKAGE).mo
	
install: ${PACKAGE}
	install -Dm0755 camoramic /usr/local/bin/camoramic
	install -Dm0644 res/org.tga.camoramic.gschema.xml /usr/share/glib-2.0/schemas/org.tga.camoramic.gschema.xml
	install -Dm0644 po/tr_TR/$(PACKAGE).mo /usr/share/locale/tr/LC_MESSAGES/$(PACKAGE).mo
	glib-compile-schemas /usr/share/glib-2.0/schemas/

	
.PHONY: clean install uninstall
