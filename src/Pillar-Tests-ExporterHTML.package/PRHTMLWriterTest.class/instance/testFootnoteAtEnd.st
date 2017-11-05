tests
testFootnoteAtEnd
	| item |
	item := PRFootnote new note: 'foo'.
	self assertWriting: item includesText: '<sup id="footnote1">[1] foo</sup>'