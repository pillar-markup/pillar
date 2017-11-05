tests-internalLinks
testFootnote
	| item |
	item := PRParagraph new
		add: (PRText content: 'timo');
		add: (PRFootnote noted: 'Bar');
		add: (PRText content: 'leon');
		yourself.
	self assertWriting: item includesText: self footnoteBar