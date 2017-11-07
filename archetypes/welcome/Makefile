OUTPUTDIRECTORY = ./build

PILLAR_HOME ?= $(shell pwd)
PILLAR_EXEC ?= $(PILLAR_HOME)/pillar

include ./support/makefiles/copySupport.mk

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

welcome: $(OUTPUTDIRECTORY)/welcome.html

$(OUTPUTDIRECTORY)/%.html: %.pillar copySupport
	$(PILLAR_EXEC) export --to=html --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$@ $<