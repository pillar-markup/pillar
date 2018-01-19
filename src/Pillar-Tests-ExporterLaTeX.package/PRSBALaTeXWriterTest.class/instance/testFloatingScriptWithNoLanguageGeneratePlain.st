tests
testFloatingScriptWithNoLanguageGeneratePlain
	| script |
	script := (PRCodeblock content: 'foo')
		caption: 'a caption';
		yourself.
	self assertWriting: script includesText: '{plain}'