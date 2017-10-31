tests - Annotation
testAnnotation
	super testAnnotation.
	self
		assert: result
		equals: (PRInputFileAnnotation parameters: 
						((SmallDictionary new
						at: 'value' put: 'Foo';
						yourself)))