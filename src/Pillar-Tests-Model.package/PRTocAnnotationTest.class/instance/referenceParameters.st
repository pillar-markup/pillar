helpers
referenceParameters
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'depthLevel')
			valueNode: (PRParameterValue value: 2).
		PRParameter 
			keyNode: (PRParameterKey named: 'level')
			valueNode: (PRParameterValue value: 3) }