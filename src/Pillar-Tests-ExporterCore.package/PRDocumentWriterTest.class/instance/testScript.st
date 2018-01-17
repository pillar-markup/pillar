tests
testScript
	| item |
	item := PRCodeblock content: 'foo'.
	self assertWriting: item includesTexts: {self scriptWithoutCaptionBegin . self foo}