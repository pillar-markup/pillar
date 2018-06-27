tests - Annotation
testUndefinedAnnotationWithParametersAsNode
	self parserInstance annotationStrategy: PRErrorSilentStrategy new.
	super testUndefinedAnnotationWithParameters.
	self
		assert: result
		equals: (PRUndefinedAnnotation withParameters: { 
			#param1 -> 'a'. #param2 -> 'b' } asDictionary ).
	self assertStart: 1 stop: 41.
	self assert: result hadAllKeys.