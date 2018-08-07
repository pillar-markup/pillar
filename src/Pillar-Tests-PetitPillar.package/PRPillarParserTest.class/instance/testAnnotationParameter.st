tests - Annotation
testAnnotationParameter
	super testAnnotationParameter.
	self assert: result equals: (PRParameter 
		keyNode: (PRParameterKey named: #value) 
		valueNode: (PRParameterValue value: 'foo'))