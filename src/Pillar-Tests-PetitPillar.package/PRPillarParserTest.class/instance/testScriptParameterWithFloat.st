tests - Script
testScriptParameterWithFloat
	| script |
	super testScriptParameterWithFloat.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'ratio' put: 0.8.
	self assert: result equals: script.
	self assertStart: 1 stop: 20.