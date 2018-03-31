tests - Annotation
testAnnotation
	super testAnnotation.
	self
		assert: result
		equals: (PRInputFileAnnotation withParameters: 
						((OrderedDictionary new
						at: 'value' put: 'Foo';
						yourself)))