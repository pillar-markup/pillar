tests - Annotation
testUndefinedAnnotationAsNode
	self parserInstance annotationStrategy: PRErrorSilentStrategy new.
	super testUndefinedAnnotation.
	self
		assert: result
		equals: ((PRUndefinedAnnotation withParameters: PRParameters new)
			tag: #undefinedAnnotation).
	self assertStart: 1 stop: 23.
	self assert: result hadAllKeys.