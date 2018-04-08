tests
testScriptDefaultLanguage
	| item |
	self supportSyntaxHighlighting
		ifFalse: [ self skip ].
	item := PRCodeblock content: 'foo'.
	configuration defaultScriptLanguage: PRHTMLScriptLanguage default.
	self assertWriting: item includesTexts: {PRHTMLScriptLanguage standardName}