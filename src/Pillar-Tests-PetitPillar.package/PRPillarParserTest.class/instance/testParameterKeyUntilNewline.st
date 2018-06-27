tests - Parameter
testParameterKeyUntilNewline
	super testParameterKeyUntilNewline.
	self assert: result equals: (PRParameterKey named: #parameterName).
	self assertStart: 1 stop: 13.