tests
testParagraph
	| item |
	item := self addText: 'foo' to: PRParagraph new.
	self assert: (self write: item) isEmpty