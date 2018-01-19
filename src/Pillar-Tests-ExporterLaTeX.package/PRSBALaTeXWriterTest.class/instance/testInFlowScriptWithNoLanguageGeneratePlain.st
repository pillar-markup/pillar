tests
testInFlowScriptWithNoLanguageGeneratePlain
	| script |
	script := PRCodeblock content: 'foo'.
	self assertWriting: script includesTexts: #('\begin{displaycode}{plain}' 'foo')