grammar - Parameter
parameterKeyUntilEndAnnotation
	^ super parameterKeyUntilEndAnnotation ==> [ :array | self stringFrom: array ]