tests - from cocoon
testReadingDefaultScriptLanguage
	|  config |
	config := self configurationClass newFromDictionary:  (Dictionary with: 'defaultScriptLanguage' -> 'smalltalk').
	self assert: config defaultScriptLanguage equals: (PRAbstractScriptLanguage for: 'smalltalk').
	
	config := self configurationClass newFromDictionary:  (Dictionary with: 'defaultScriptLanguage' -> 'css').
	self assert: config defaultScriptLanguage equals: (PRAbstractScriptLanguage for: 'css')