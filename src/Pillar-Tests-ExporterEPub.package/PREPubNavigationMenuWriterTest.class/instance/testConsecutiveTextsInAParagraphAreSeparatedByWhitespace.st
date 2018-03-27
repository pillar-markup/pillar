tests
testConsecutiveTextsInAParagraphAreSeparatedByWhitespace
	| item |
	item := PRParagraph new
		add: (PRText content: 'foo');
		add: (PRLineBreak new);
		add: (PRText content: 'bar');
		yourself.
	self assert: (self write: item) isEmpty