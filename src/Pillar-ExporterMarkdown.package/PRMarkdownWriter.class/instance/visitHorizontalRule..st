visiting
visitHorizontalRule: anHorizontalRule
	"http://spec.commonmark.org/0.28/#thematic-breaks"
	
	"The result is line, so using dashes and not e.g. asterisks would make more sense."

	canvas
		newLine;
		newLine.
	canvas raw: '---'.
	canvas newLine