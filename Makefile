#!/usr/bin/make -f

SHELL = /bin/sh
.SUFFIXES:			# We don't use suffixes for this Makefile
.DELETE_ON_ERROR:	# We want make to delete partially-created targets
VERSION := $(shell grep '^\#\# Version: ' WeightsWatcher.toc | sed -e 's/.* //')
OUTPUT_FILENAME := "WeightsWatcher-$(VERSION).zip"
EXCLUDED_FILES = .git* Todo* *~ *.sh gem-ids* create-* Makefile
EXCLUDE_PATTERNS = $(foreach str,$(EXCLUDED_FILES),-xr!'$(str)')


.PHONY: clean
clean:

.PHONY: distclean
distclean:
	-rm -f ../$(OUTPUT_FILENAME)

.PHONY: dist
dist:
	@[ -f ../$(OUTPUT_FILENAME) ] || exit 0 && echo "Output file $(OUTPUT_FILENAME) exists! Aborting..." && exit 1
	cd .. && 7z a -tzip $(EXCLUDE_PATTERNS) -mx=9 $(OUTPUT_FILENAME) WeightsWatcher/
