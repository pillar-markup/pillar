tests
testScript
	| item |
	item := PRScript content: 'foo'.
	self assertWriting: item includesTexts: {self scriptWithoutCaptionBegin . self foo}