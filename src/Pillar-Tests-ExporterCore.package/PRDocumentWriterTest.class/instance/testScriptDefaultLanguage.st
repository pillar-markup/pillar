tests
testScriptDefaultLanguage
	| item |
	self supportSyntaxHighlighting
		ifFalse: [ self skip ].
	item := PRScript content: 'foo'.
	configuration defaultScriptLanguage: PRHTMLScriptLanguage default.
	self assertWriting: item includesTexts: {PRHTMLScriptLanguage standardName}