tests - Script
testScriptWithNewLine
	super testScriptWithNewLine.
	self assert: result equals: (PRCodeblock content: 'foo').
	self assertStart: 1 stop: 12.