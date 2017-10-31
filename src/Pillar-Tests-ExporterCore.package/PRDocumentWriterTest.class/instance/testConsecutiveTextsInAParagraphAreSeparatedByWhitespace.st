tests
testConsecutiveTextsInAParagraphAreSeparatedByWhitespace
	| item |
	item := PRParagraph new
		add: (PRText content: 'foo');
		add: (PRLineBreak new);
		add: (PRText content: 'bar');
		yourself.
	self assertWriting: item includesText: 'foo', self configuration newLine, 'bar'