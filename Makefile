txtfiles  := $(patsubst %.xml,%.txt,$(wildcard draft-*.xml))
htmlfiles := $(patsubst %.xml,%.html,$(wildcard draft-*.xml))


all:   $(txtfiles) $(htmlfiles)


$(txtfiles):	%.txt: %.xml
	xml2rfc $< $@ --text
	~/.local/bin/idnits $@

$(htmlfiles):	%.html: %.xml
	xml2rfc $< $@ --html


clean:
	rm -f *.txt *.html
