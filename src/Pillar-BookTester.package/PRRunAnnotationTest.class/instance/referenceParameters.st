helpers
referenceParameters
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'testClass')
			valueNode: (PRParameterValue value: 'PRBookTestDummyRunAnnotation').
		}