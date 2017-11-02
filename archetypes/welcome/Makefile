OUTPUTDIRECTORY = ./build
HTMLTEMPLATE = support/templates/welcome.html.template

PILLAR_HOME ?= $(shell pwd)
PILLAR_EXEC ?= $(PILLAR_HOME)/pillar
MUSTACHE_EXEC ?= $(PILLAR_HOME)/mustache

include ./support/makefiles/copySupport.mk

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

welcome: $(OUTPUTDIRECTORY)/welcome.html

$(OUTPUTDIRECTORY)/%.html.json: %.pillar copySupport
	$(PILLAR_EXEC) export --to=html --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.html: $(OUTPUTDIRECTORY)/%.html.json
	$(MUSTACHE_EXEC) --data=$< --template=${HTMLTEMPLATE} > $@