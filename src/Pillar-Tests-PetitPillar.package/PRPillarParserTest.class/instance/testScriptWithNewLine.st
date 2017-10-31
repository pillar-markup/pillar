tests - Script
testScriptWithNewLine
	super testScriptWithNewLine.
	self assert: result equals: (PRScript content: 'foo')