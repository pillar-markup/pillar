tests - Parameter
testParameterUntilNewline
	<expectedFailure>
	super testParameterUntilNewline.
	self assert: result equals: (PRParameter 
		keyNode: (PRParameterKey named: #foo) 
		valueNode: (PRParameterValue value: 'bar')).
	self deny: result = (PRParameter 
		keyNode: (PRParameterKey named: #bar) 
		valueNode: (PRParameterValue value: 'foo')).
	self assertStart: 1 stop: 7.
	self assertStart: 1 stop: 3 ofNode: result keyNode.
	self assertStart: 5 stop: 7 ofNode: result valueNode.