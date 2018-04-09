tests
testFootnote
	| item |
	item := PRParagraph new
		add: (PRText content: 'timo');
		add: (PRFootnote noted: 'Bar');
		add: (PRText content: 'leon');
		yourself.
	self assert: (self write: item) isEmpty