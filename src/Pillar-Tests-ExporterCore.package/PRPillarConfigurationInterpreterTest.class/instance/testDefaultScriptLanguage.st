tests
testDefaultScriptLanguage
	| ston configuration |
	ston := '{ #defaultScriptLanguage : "smalltalk" }'.
	configuration := self fromString: ston.
	self assert: configuration defaultScriptLanguage class equals: PRSmalltalkScriptLanguage.
	
	ston := '{ #defaultScriptLanguage : "" }'.
	configuration := self fromString: ston.
	self assert: configuration defaultScriptLanguage class equals: PRNoScriptLanguage.