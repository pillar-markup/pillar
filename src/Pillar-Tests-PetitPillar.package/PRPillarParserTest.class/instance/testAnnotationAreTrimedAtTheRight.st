tests - Annotation
testAnnotationAreTrimedAtTheRight
	super testAnnotationAreTrimedAtTheRight.
	self
		assert: result
		equals:
			(PRInputFileAnnotation
				withParameters:
					(PRParameters withAll: { 
							(PRParameter 
								keyNode: (PRParameterKey named: #path) 
								valueNode: (PRParameterValue value: 'Foo')) })).
	self assertStart: 1 stop: 22.