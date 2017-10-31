tests - Script
testScriptWithSpaceAtTheEnd
	super testScriptWithSpaceAtTheEnd.
	self assert: result equals: (PRScript content: 'foo')