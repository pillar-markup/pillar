tests - Parameter
testParameterValueUntilNewline
	super testParameterValueUntilNewline.
	self assert: result equals: (PRParameterValue value: #parameterValue).
	self assertStart: 2 stop: 15.