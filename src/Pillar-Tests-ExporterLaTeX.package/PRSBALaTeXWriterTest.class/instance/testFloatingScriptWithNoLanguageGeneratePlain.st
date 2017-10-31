tests
testFloatingScriptWithNoLanguageGeneratePlain
	| script |
	script := (PRScript content: 'foo')
		caption: 'a caption';
		yourself.
	self assertWriting: script includesText: '{plain}'