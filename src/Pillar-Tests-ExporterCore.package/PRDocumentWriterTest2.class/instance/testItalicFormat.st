tests
testItalicFormat
	| item |
	item := self addText: 'foo' to: PRItalicFormat new.
	self
		assertWriting: item
		includesTexts:
			{self italicFoo}