tests - Annotation
testUndefinedAnnotationWithParametersAsNode
	self parserInstance annotationStrategy: PRErrorSilentStrategy new.
	super testUndefinedAnnotationWithParameters.
	self
		assert: result
		equals: (PRUndefinedAnnotation new withParameters: { 
			#param1 -> 'a'. #param2 -> 'b' } asOrderedDictionary ).
	self assertStart: 1 stop: 41.
	self assert: result hadAllKeys.