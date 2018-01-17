tests
testScriptsHaveACaption
	| item caption |
	caption := 'A description'.
	item := (PRCodeblock content: 'foo')
		caption:  caption;
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self scriptWithCaptionBegin).
			caption}