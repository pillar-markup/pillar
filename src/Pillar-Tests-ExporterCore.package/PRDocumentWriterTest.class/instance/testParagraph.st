tests
testParagraph
	| item |
	item := self addText: 'foo' to: PRParagraph new.
	self assertWriting: item includesText: self paragraphFoo