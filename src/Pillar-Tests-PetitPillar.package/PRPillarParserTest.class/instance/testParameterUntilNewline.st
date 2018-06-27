tests - Parameter
testParameterUntilNewline
	super testParameterUntilNewline.
	self assert: result equals: (PRParameter 
		keyNode: (PRParameterKey named: #foo) 
		valueNode: (PRParameterValue value: 'bar')).
	self assertStart: 1 stop: 7.
	self assertStart: 1 stop: 3 ofNode: result keyNode.
	self assertStart: 5 stop: 7 ofNode: result valueNode.