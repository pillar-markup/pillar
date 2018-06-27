tests - Parameter
testParameterValueUntilNewline
	<expectedFailure>
	super testParameterValueUntilNewline.
	self assert: result equals: (PRParameterValue value: #parameterValue).
	self deny: result = (PRParameterValue value: #parameterValue2).
	self assertStart: 2 stop: 15.