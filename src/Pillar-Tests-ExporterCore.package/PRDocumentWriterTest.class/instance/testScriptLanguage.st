tests
testScriptLanguage
	| item |
	self supportSyntaxHighlighting ifFalse: [ self skip ].
	item := (PRCodeblock content: 'foo')
		language: 'html';
		yourself.
	self assertWriting: item includesTexts: {(PRHTMLScriptLanguage standardName)}