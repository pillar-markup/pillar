tests - Script
testScriptParameterEndsWithSpace
	| script |
	super testScriptParameterTrueByDefault.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: true.
	self assert: result equals: script.
	self assertStart: 1 stop: 14.