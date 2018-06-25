tests - Annotation
testAnnotationAreTrimedAtTheRight
	super testAnnotationAreTrimedAtTheRight.
	self
		assert: result
		equals:
			(PRInputFileAnnotation
				withParameters:
					(OrderedDictionary new
						at: 'path' put: 'Foo';
						yourself))