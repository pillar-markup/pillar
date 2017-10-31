tests
testPreformatted
	| item |
	item := self addText: 'foo' to: PRPreformatted new.
	self assertWriting: item includesTexts: {self preformattedFooBegin . self preformattedTextFoo}