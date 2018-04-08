tests
testSubscriptFormat
	| item |
	item := self addText: 'foo' to: PRSubscriptFormat new.
	self
		assertWriting: item
		includesTexts:
			{self subscriptFoo}