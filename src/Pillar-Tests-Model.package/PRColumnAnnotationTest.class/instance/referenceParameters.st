helpers
referenceParameters
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'width')
			valueNode: (PRParameterValue value: 50) }