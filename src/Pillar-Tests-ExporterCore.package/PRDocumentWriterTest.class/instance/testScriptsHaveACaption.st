tests
testScriptsHaveACaption
	| item caption |
	caption := 'A description'.
	item := (PRScript content: 'foo')
		caption:  caption;
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self scriptWithCaptionBegin).
			caption}