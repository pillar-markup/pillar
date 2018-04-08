tests
testSuperscriptFormat
	| item |
	item := self addText: 'foo' to: PRSuperscriptFormat new.
	self
		assertWriting: item
		includesTexts:
			{self superscriptFoo}