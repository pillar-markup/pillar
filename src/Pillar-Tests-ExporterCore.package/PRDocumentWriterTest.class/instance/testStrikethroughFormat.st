tests
testStrikethroughFormat
	| item |
	item := self addText: 'foo' to: PRStrikethroughFormat new.
	self
		assertWriting: item
		includesTexts:
			{self strikethroughFoo}