tests - Annotation
testAnnotationAreTrimedAtTheRight
	super testAnnotationAreTrimedAtTheRight.
	self
		assert: result
		equals:
			(PRInputFileAnnotation
				parameters:
					(SmallDictionary new
						at: 'value' put: 'Foo';
						yourself))