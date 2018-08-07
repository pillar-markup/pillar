tests - Annotation
testAnnotationWithUnknownKeyAsNode
	PRValidation beSilentDuring: [ 
		super testAnnotationWithUnknownKey.
		self
			assert: result
			equals: (PRInputFileAnnotation withParameters: 
							(PRParameters withAll: { 
								(PRParameter 
									keyNode: (PRParameterKey named: #path) 
									valueNode: (PRParameterValue value: 'Foo')).
								(PRParameter 
									keyNode: (PRParameterKey named: #unknownKey) 
									valueNode: (PRParameterValue value: 'Bar')) })) ].
	self assertStart: 1 stop: 37.
	self assert: result children first children first isValid.
	self deny: result children first children second isValid.
	