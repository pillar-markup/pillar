tests - Annotation
testAnnotation
	super testAnnotation.
	self
		assert: result
		equals: (PRInputFileAnnotation withParameters: 
						((SmallDictionary new
						at: 'value' put: 'Foo';
						yourself)))