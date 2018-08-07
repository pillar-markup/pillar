tests - Annotation
testAnnotation
	super testAnnotation.
	self
		assert: result
		equals: (PRInputFileAnnotation withParametersInCollection: 
						((OrderedDictionary new
						at: 'path' put: 'Foo';
						yourself)))