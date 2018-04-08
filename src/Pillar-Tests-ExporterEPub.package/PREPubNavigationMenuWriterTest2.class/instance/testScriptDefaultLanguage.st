tests
testScriptDefaultLanguage
	| item |
	self supportSyntaxHighlighting
		ifFalse: [ self skip ].
	item := PRCodeblock content: 'foo'.
	self assert: (self write: item) isEmpty