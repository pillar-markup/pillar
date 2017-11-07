OUTPUTDIRECTORY = build

PILLAR_HOME ?= $(shell pwd)
PILLAR_EXEC ?= $(PILLAR_HOME)/pillar

include ./support/makefiles/copySupport.mk

presentation: $(OUTPUTDIRECTORY)/presentation.pdf $(OUTPUTDIRECTORY)/presentation.html

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

$(OUTPUTDIRECTORY)/%.tex: %.pillar copySupport
	$(PILLAR_EXEC) export --to="Beamer" --outputFile=$@ $<

$(OUTPUTDIRECTORY)/%.pdf: $(OUTPUTDIRECTORY)/%.tex
	# latexmk -silent -outdir=${OUTPUTDIRECTORY} -use-make -pdf $<
	latexmk -outdir=${OUTPUTDIRECTORY} -aux-directory=${OUTPUTDIRECTORY} -pdf $<
	# make cleanBookResult

$(OUTPUTDIRECTORY)/%.html: %.pillar copySupport
	$(PILLAR_EXEC) export --to="DeckJS" --outputFile=$@ $<

cleanBookResult:
	rm ${OUTPUTDIRECTORY}/*.aux ${OUTPUTDIRECTORY}/*.fls ${OUTPUTDIRECTORY}/*.log ${OUTPUTDIRECTORY}/*.fdb_latexmk ${OUTPUTDIRECTORY}/*.listing ${OUTPUTDIRECTORY}/*.nav ${OUTPUTDIRECTORY}/*.out ${OUTPUTDIRECTORY}/*.snm ${OUTPUTDIRECTORY}/*.toc ${OUTPUDIRECTORY}/*.vrb

clean:
	rm -fr ${OUTPUTDIRECTORY}
