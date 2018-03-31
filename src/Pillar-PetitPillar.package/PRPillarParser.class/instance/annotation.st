grammar - Annotation
annotation
	^ super annotation
		==>
			[ :array | array second withParameters: (array third ifNil: [ OrderedDictionary new ]) ]