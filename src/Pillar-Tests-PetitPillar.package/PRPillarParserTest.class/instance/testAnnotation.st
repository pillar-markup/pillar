tests - Annotation
testAnnotation
	super testAnnotation.
	self
		assert: result
		equals: (PRInputFileAnnotation withParameters: 
						(PRParameters withAll: { 
							(PRParameter 
								keyNode: (PRParameterKey named: #path) 
								valueNode: (PRParameterValue value: 'Foo')) })).
	self assert: result children size equals: 1.
	self assertStart: 1 stop: 22.