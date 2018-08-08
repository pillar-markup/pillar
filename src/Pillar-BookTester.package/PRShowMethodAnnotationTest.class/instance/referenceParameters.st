helpers
referenceParameters
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'method')
			valueNode: (PRParameterValue value: 'testDummyAnnotation').
		PRParameter 
			keyNode: (PRParameterKey named: 'class')
			valueNode: (PRParameterValue value: 'PRBookTestDummyShowMethodAnnotation'). 
		}