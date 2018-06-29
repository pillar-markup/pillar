tests - Annotation
testAnnotationWithoutParametersAsNode
	PRValidation beSilentDuring: [ 
		super testAnnotationWithoutParameters.
		self
			assert: result
			equals: (PRInputFileAnnotation withParameters: PRParameters new) ].
	self assertStart: 1 stop: 13.
	self assert: result children size equals: 1.
	self deny: result isValid.