tests - Parameter
testParameterValueUntilNewline
	super testParameterValueUntilNewline.
	self assert: result equals: (PRParameterValue value: #parameterValue).
	self assertStart: 1 stop: 15.