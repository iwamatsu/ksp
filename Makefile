# makefile to publish webpage

MUSE_FILES = $(wildcard *.muse)
HTML_FILES = $(MUSE_FILES:%.muse=html/%.html)
UPLOAD_FILES = $(HTML_FILES) $(wildcard html/*.css)
RELEASEFILES:=$(UPLOAD_FILES:%=%.release-stamp)

all: $(HTML_FILES)

html/%.html: %.muse
	umask 002; emacs -batch -l muse-config.el -eval '(muse-project-publish "ksp")'

preview: all
	iceweasel -remote "openurl($${PWD}/html/index.html)"

clean:
	-rm *~

.PHONY: all preview clean
