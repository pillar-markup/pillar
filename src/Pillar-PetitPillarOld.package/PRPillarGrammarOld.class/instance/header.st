grammar - Header
header
	"A header begin by a certain amount of $! and contains a text and/or some formatedText"

	^ (Markups at: PRHeader) asParser plus token , oneLineContent optional trimBlanks