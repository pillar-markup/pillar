tests - Annotation
testAnnotationParameters2
	| expected |
	super testAnnotationParameters.
	expected := PRParameters withAll: { 
		(PRParameter 
			keyNode: (PRParameterKey named: #foo) 
			valueNode: (PRParameterValue value: 'bar')).
		(PRParameter 
			keyNode: (PRParameterKey named: #timo) 
			valueNode: (PRParameterValue value: 'leon')) }.
	self assert: result equals: expected