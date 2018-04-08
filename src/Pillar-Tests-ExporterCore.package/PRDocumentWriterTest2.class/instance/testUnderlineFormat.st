tests
testUnderlineFormat
	| item |
	item := self addText: 'foo' to: PRUnderlineFormat new.
	self
		assertWriting: item
		includesTexts:
			{self underlineFoo}