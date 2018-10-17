helpers
referenceParameters
^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'class')
			valueNode: (PRParameterValue value: 'PRScreenshotAnnotationTest').
		PRParameter 
			keyNode: (PRParameterKey named: 'method')
			valueNode: (PRParameterValue value: 'referenceString').
		PRParameter 
			keyNode: (PRParameterKey named: 'caption')
			valueNode: (PRParameterValue value: 'The referenceString method').
		PRParameter 
			keyNode: (PRParameterKey named: 'width')
			valueNode: (PRParameterValue value: 50). 
		PRParameter 
			keyNode: (PRParameterKey named: 'label')
			valueNode: (PRParameterValue value: 'refStr').}
	