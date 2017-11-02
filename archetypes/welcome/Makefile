OUTPUTDIRECTORY = ./build
HTMLTEMPLATE = support/templates/welcome.html.template
PILLAR_HOME ?= $(shell pwd)

include ./support/makefiles/copySupport.mk

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

welcome: $(OUTPUTDIRECTORY)/welcome.html

$(OUTPUTDIRECTORY)/%.html.json: %.pillar copySupport
	$(PILLAR_HOME)/pillar export --to=html --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.html: $(OUTPUTDIRECTORY)/%.html.json
	$(PILLAR_HOME)/mustache --data=$< --template=${HTMLTEMPLATE} > $@