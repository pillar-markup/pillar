tests - Script
testScriptWithLanguage
	super testScriptWithLanguage.
	self
		assert: result
		equals:
			((PRScript content: 'foo')
				language: PRSmalltalkScriptLanguage default;
				yourself)