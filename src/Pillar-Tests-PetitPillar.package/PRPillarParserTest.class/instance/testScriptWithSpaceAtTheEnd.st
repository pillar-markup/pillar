tests - Script
testScriptWithSpaceAtTheEnd
	super testScriptWithSpaceAtTheEnd.
	self assert: result equals: (PRCodeblock content: 'foo').
	self assertStart: 1 stop: 13.