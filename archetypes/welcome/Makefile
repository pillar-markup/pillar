OUTPUTDIRECTORY = ./build
HTMLTEMPLATE = support/templates/welcome.html.template

include ./support/makefiles/copySupport.mk

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

welcome: $(OUTPUTDIRECTORY)/welcome.html

$(OUTPUTDIRECTORY)/%.html.json: %.pillar copySupport
	./pillar export --to=html --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.html: $(OUTPUTDIRECTORY)/%.html.json
	./mustache --data=$< --template=${HTMLTEMPLATE} > $@
