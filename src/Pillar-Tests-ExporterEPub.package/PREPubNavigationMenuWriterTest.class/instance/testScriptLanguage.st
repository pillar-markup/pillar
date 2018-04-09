tests
testScriptLanguage
	| item |
	self supportSyntaxHighlighting ifFalse: [ self skip ].
	item := (PRCodeblock content: 'foo')
		language: 'html';
		yourself.
	self assert: (self writeWithSeparateOutputFiles: item) isEmpty