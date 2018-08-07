tests - Script
testScriptWithLanguage
	super testScriptWithLanguage.
	self
		assert: result
		equals:
			((PRCodeblock content: 'foo')
				language: PRSmalltalkScriptLanguage default;
				yourself).
	self assertStart: 1 stop: 29.