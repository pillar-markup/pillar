tests
testLanguageForScript2
	"This test documents how to map values to script languages"
	
	self assert: (PRRealScriptLanguage for: nil) class equals: PRUnspecifiedScriptLanguage.
	self assert: (PRRealScriptLanguage for: 'nil') class equals:  PRUnsupportedScriptLanguage.
	self assert: (PRRealScriptLanguage for: '') class equals:  PRUnsupportedScriptLanguage.
	self assert: (PRRealScriptLanguage for: 'smalltalk') class equals:  PRSmalltalkScriptLanguage.