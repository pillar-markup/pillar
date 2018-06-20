tests - Script
testScriptParameterEndsWithSpace
	| script |
	super testScriptParameterTrueByDefault.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: true.
	self assert: result equals: script