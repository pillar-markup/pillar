tests - Script
testScriptParameterWithLiteralArray
	| script |
	super testScriptParameterWithLiteralArray.
	script := PRCodeblock content: 'bar'.
	script parameters at: 'foo' put: #(1 2 true).
	self assert: result equals: script.
	self assertStart: 1 stop: 26.
	self flag: 'the rest in not supported yet'.
	true ifTrue: [ ^ self ].
	self assertStart: 4 stop: 18 ofNode: result parameters.
	self assertStart: 4 stop: 18 ofNode: (result parameters nodeAt: #foo).
	self assertStart: 4 stop: 7 ofNode: (result parameters nodeAt: #foo) keyNode.
	self assertStart: 9 stop: 18 ofNode: (result parameters nodeAt: #foo) valueNode.