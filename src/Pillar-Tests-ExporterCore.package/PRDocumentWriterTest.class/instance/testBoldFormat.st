tests
testBoldFormat
	| item |
	item := self addText: 'foo' to: PRBoldFormat new.
	self
		assertWriting: item
		includesTexts:
			{self boldFoo}