PILLAR_HOME ?= $(shell pwd)
PILLAR_EXEC ?= $(PILLAR_HOME)/pillar

$(call check_defined, HTMLTEMPLATE, Template for main document in HTML)
$(call check_defined, HTMLCHAPTERTEMPLATE, Template for individual chapters in HTML)

.phony: html htmlbook htmlchapters html-clean

html: htmlbook htmlchapters ## Everything HTML
htmlbook: $(OUTPUTDIRECTORY)/$(MAIN).html
htmlchapters: $(CHAPTERS:%=$(OUTPUTDIRECTORY)/%.html)

clean: html-clean
html-clean: # Nothing

$(OUTPUTDIRECTORY)/$(MAIN).html: $(CHAPTERS:%=%.pillar)
$(OUTPUTDIRECTORY)/%.html: %.pillar | prepare
	$(PILLAR_EXEC) export --to="HTML" --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$@ $<