-include $(wildcard *.d)

%.pdf: %.tex
	latexmk -pdflatex=lualatex -pdf -use-make \
		-latexoption="--file-line-error --halt-on-error" \
		-deps-out="$*.d" \
		$<
