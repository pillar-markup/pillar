tests - Script
testScriptParameterWithNoValues
	| script |
	super testScriptParameterWithNoValues.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: ''.
	self assert: result equals: script.
	self assertStart: 1 stop: 15.