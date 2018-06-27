tests - Parameter
testParametersUntilNewline
	super testParametersUntilNewline.
	self assert: result equals: (PRParameters withAll: { 
		(PRParameter 
			keyNode: (PRParameterKey named: #foo) 
			valueNode: (PRParameterValue value: 'bar')).
		(PRParameter 
			keyNode: (PRParameterKey named: #baz) 
			valueNode: (PRParameterValue value: 'true')) }).
	self assertStart: 1 stop: 16.
	self assertStart: 1 stop: 7 ofNode: result children first.
	self assertStart: 9 stop: 16 ofNode: result children second.
	self assertStart: 1 stop: 3 ofNode: result children first keyNode.
	self assertStart: 4 stop: 7 ofNode: result children first valueNode.
	self assertStart: 9 stop: 11 ofNode: result children second keyNode.
	self assertStart: 12 stop: 16 ofNode: result children second valueNode.