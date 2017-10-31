tests - Script
testScriptParameterWithNoValues
	| script |
	super testScriptParameterWithNoValues.
	script := PRScript content: 'bar'.
	script parameters at: 'foo' put: ''.
	self assert: result equals: script