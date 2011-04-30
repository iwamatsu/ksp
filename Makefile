# makefile to publish webpage

MUSE_FILES = $(wildcard *.muse)
HTML_FILES = $(MUSE_FILES:%.muse=html/%.html)
UPLOAD_FILES = $(HTML_FILES) $(wildcard html/*.css)
RELEASEFILES:=$(UPLOAD_FILES:%=%.release-stamp)

all: mkdir $(HTML_FILES) css

mkdir:
	@[ -d html ] || mkdir -p html

html/%.html: %.muse
	umask 002; emacs -batch -l muse-config.el -eval '(muse-project-publish "ksp")'

css:
	@cp style.css html/

preview: all
	iceweasel -remote "openurl($${PWD}/html/index.html)"

clean:
	-@rm *~

distclean:
	rm -fr html

.PHONY: all preview clean
