grammar - Annotation
annotation
	^ super annotation
		==>
			[ :array | array second withParametersInCollection: (array third ifNil: [ OrderedDictionary new ]) ]