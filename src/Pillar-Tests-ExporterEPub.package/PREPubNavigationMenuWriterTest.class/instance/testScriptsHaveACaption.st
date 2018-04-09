tests
testScriptsHaveACaption
	| item caption |
	caption := 'A description'.
	item := (PRCodeblock content: 'foo')
		caption:  caption;
		yourself.
	self assert: (self write: item) isEmpty