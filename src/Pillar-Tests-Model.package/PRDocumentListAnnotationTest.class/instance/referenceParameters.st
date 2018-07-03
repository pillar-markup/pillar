helpers
referenceParameters
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'path')
			valueNode: (PRParameterValue value: 'blogs').
		PRParameter 
			keyNode: (PRParameterKey named: 'limit')
			valueNode: (PRParameterValue value: 10).
		PRParameter 
			keyNode: (PRParameterKey named: 'sort')
			valueNode: (PRParameterValue value: 'date') }