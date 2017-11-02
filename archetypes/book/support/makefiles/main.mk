PILLAR_HOME ?= $(shell pwd)
PILLAR_EXEC ?= $(PILLAR_HOME)/pillar
MUSTACHE_EXEC ?= $(PILLAR_HOME)/mustache

MAIN := $(shell $(PILLAR_EXEC) introspect mainDocument)

OUTPUTDIRECTORY := $(shell $(PILLAR_EXEC) introspect outputDirectory)
LATEXTEMPLATE := $(shell $(PILLAR_EXEC) introspect latexTemplate)
LATEXCHAPTERTEMPLATE := $(shell $(PILLAR_EXEC) introspect latexChapterTemplate)
HTMLTEMPLATE := $(shell $(PILLAR_EXEC) introspect htmlTemplate)
HTMLCHAPTERTEMPLATE := $(shell $(PILLAR_EXEC) introspect htmlChapterTemplate)
CHAPTERS := $(shell $(PILLAR_EXEC) introspect chapters)

.phony: all book chapters

all: pdf html ## Build everything in all formats
book: pdfbook htmlbook ## Full book only, all formats
chapters: pdfchapters htmlchapters ## Separate chapters, all formats

include support/makefiles/help.mk
include support/makefiles/prepare.mk
include support/makefiles/pdf.mk
include support/makefiles/html.mk
include support/makefiles/epub.mk