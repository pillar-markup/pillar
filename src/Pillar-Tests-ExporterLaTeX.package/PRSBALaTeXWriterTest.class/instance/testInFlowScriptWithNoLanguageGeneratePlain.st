tests
testInFlowScriptWithNoLanguageGeneratePlain
	| script |
	script := PRScript content: 'foo'.
	self assertWriting: script includesTexts: #('\begin{displaycode}{plain}' 'foo')