tests - Annotation
testUndefinedAnnotationWithParametersAsNode
	self parserInstance annotationStrategy: PRErrorSilentStrategy new.
	super testUndefinedAnnotationWithParameters.
	self
		assert: result
		equals: (PRUndefinedAnnotation withParameters: (
			PRParameters withAll: { 
				(PRParameter 
					keyNode: (PRParameterKey named: #param1) 
					valueNode: (PRParameterValue value: 'a')).
				(PRParameter 
					keyNode: (PRParameterKey named: #param2) 
					valueNode: (PRParameterValue value: 'b')) })).
	self assert: result children size equals: 1.
	self assertStart: 1 stop: 41.
	self assert: result hadAllKeys.