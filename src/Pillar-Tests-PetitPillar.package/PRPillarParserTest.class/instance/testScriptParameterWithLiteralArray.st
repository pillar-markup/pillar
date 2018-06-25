tests - Script
testScriptParameterWithLiteralArray
	| script |
	super testScriptParameterWithLiteralArray.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: #(1 2 true).
	self assert: result equals: script.
	self assertStart: 1 stop: 26.