-include $(wildcard *.d)

%.pdf: %.tex
	latexmk -pdf -use-make \
		-latexoption="--file-line-error --halt-on-error" \
		-deps-out="$*.d" \
		$<
