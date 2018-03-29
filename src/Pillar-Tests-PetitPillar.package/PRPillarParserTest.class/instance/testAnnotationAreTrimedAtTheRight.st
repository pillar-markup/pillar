tests - Annotation
testAnnotationAreTrimedAtTheRight
	super testAnnotationAreTrimedAtTheRight.
	self
		assert: result
		equals:
			(PRInputFileAnnotation
				withParameters:
					(SmallDictionary new
						at: 'value' put: 'Foo';
						yourself))