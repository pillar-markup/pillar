tests - Script
testScriptWithNewLine
	super testScriptWithNewLine.
	self assert: result equals: (PRCodeblock content: 'foo')