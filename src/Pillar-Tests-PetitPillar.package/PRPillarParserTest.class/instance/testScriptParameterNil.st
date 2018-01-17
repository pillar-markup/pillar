tests - Script
testScriptParameterNil
	| script |
	super testScriptParameterNil.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: nil.
	self assert: result equals: script