tests - Script
testScriptWithSpaceAtTheEnd
	super testScriptWithSpaceAtTheEnd.
	self assert: result equals: (PRCodeblock content: 'foo')