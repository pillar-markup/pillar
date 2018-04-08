tests
testMonospaceFormat
	| item |
	item := self addText: 'foo' to: PRMonospaceFormat new.
	self
		assertWriting: item
		includesTexts:
			{self monospaceFoo}