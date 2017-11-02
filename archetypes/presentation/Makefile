OUTPUTDIRECTORY = book-result
LATEXTEMPLATE = support/templates/presentation.beamer.template
HTMLTEMPLATE = support/templates/presentation.deckjs.template

PILLAR_HOME ?= $(shell pwd)
PILLAR_EXEC ?= $(PILLAR_HOME)/pillar
MUSTACHE_EXEC ?= $(PILLAR_HOME)/mustache

include ./support/makefiles/copySupport.mk

presentation: $(OUTPUTDIRECTORY)/presentation.pdf $(OUTPUTDIRECTORY)/presentation.html

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

$(OUTPUTDIRECTORY)/%.tex.json: %.pillar copySupport
	$(PILLAR_EXEC) export --to="Beamer" --outputDirectory=$(OUTPUTDIRECTORY) $<

$(OUTPUTDIRECTORY)/%.tex: $(OUTPUTDIRECTORY)/%.tex.json
	$(MUSTACHE_EXEC) --data=$< --template=${LATEXTEMPLATE} > $@

$(OUTPUTDIRECTORY)/%.pdf: $(OUTPUTDIRECTORY)/%.tex
	# latexmk -silent -outdir=${OUTPUTDIRECTORY} -use-make -pdf $<
	latexmk -outdir=${OUTPUTDIRECTORY} -aux-directory=${OUTPUTDIRECTORY} -pdf $<
	# make cleanBookResult

$(OUTPUTDIRECTORY)/%.html.json: %.pillar copySupport
	$(PILLAR_EXEC) export --to="DeckJS" --outputDirectory=$(OUTPUTDIRECTORY) $<

$(OUTPUTDIRECTORY)/%.html: $(OUTPUTDIRECTORY)/%.html.json
	$(MUSTACHE_EXEC) --data=$< --template=${HTMLTEMPLATE} > $@

cleanBookResult:
	rm ${OUTPUTDIRECTORY}/*.aux ${OUTPUTDIRECTORY}/*.fls ${OUTPUTDIRECTORY}/*.log ${OUTPUTDIRECTORY}/*.fdb_latexmk ${OUTPUTDIRECTORY}/*.listing ${OUTPUTDIRECTORY}/*.nav ${OUTPUTDIRECTORY}/*.out ${OUTPUTDIRECTORY}/*.snm ${OUTPUTDIRECTORY}/*.toc ${OUTPUDIRECTORY}/*.vrb

clean:
	rm -fr ${OUTPUTDIRECTORY}
