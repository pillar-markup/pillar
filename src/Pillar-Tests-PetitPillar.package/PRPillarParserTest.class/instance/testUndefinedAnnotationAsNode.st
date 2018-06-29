tests - Annotation
testUndefinedAnnotationAsNode
	PRValidation beSilentDuring: [ super testUndefinedAnnotation ].
	self
		assert: result
		equals: ((PRUndefinedAnnotation withParameters: PRParameters new)
			tag: #undefinedAnnotation).
	self assertStart: 1 stop: 23.
	self assert: result hadAllKeys.
	self assert: result isValid.
	self assert: result tag equals: #undefinedAnnotation.