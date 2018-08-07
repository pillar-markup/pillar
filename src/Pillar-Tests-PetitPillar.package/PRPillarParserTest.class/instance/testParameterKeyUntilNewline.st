tests - Parameter
testParameterKeyUntilNewline
	<expectedFailure>
	super testParameterKeyUntilNewline.
	self assert: result equals: (PRParameterKey named: #parameterName).
	self deny: result = (PRParameterKey named: #parameterName2).
	self assertStart: 1 stop: 13.