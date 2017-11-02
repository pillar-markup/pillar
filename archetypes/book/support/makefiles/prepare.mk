$(call check_defined, OUTPUTDIRECTORY, Directory for build products)
$(call check_defined, MAIN, Base name of the main document)
$(call check_defined, CHAPTERS, Base names of the chapters)

.phony: prepare clean wipeout

FIGURES := $(shell find . \
		-type f \
		-path '*/figures/*' \
		! -path './$(OUTPUTDIRECTORY)/*' \
		! -path './support/*' \
		-print)

clean: ## Cleanup intermediate build products
	rm -f $(addprefix $(OUTPUTDIRECTORY)/, support)
	for f in $(addprefix $(OUTPUTDIRECTORY)/,$(MAIN) $(CHAPTERS)); do \
		rm -f "$$(dirname $$f)/root" ; \
	done

wipeout: ## Cleanup everything including final build products
	rm -fr ${OUTPUTDIRECTORY}

# create & initialize output directory, mirroring stuff that has to match the
# repo hierarchy inside the output dir.
prepare: $(addprefix $(OUTPUTDIRECTORY)/, support $(FIGURES))

$(OUTPUTDIRECTORY):
	mkdir -p $(OUTPUTDIRECTORY)

$(OUTPUTDIRECTORY)/support: $(OUTPUTDIRECTORY)
	cp -r support $(OUTPUTDIRECTORY)

# this is making hardlinks (symlinks are verbose with absolute paths and
# computing relative paths is… complicated)
$(FIGURES:%=$(OUTPUTDIRECTORY)/%): $(OUTPUTDIRECTORY)/% : %
	@mkdir -p $(dir $@)
	cp $< $@
