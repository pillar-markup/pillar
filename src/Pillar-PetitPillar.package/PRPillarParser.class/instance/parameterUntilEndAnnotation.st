grammar - Parameter
parameterUntilEndAnnotation
	^ super parameterUntilEndAnnotation ==>
			[ :array | self parameterFrom: array ]