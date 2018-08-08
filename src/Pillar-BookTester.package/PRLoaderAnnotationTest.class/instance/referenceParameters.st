helpers
referenceParameters
	
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'account')
			valueNode: (PRParameterValue value: 'QDucasse').
		PRParameter 
			keyNode: (PRParameterKey named: 'project')
			valueNode: (PRParameterValue value: 'MetacelloTestBook-Code').
		PRParameter 
			keyNode: (PRParameterKey named: 'tag')
			valueNode: (PRParameterValue value: 'Chapter1').
		PRParameter 
			keyNode: (PRParameterKey named: 'baseline')
			valueNode: (PRParameterValue value: 'MetacelloTestBook') 
		}
