grammar - Parameter
parameterKeyUntilEndAnnotation
	^ super parameterKeyUntilEndAnnotation ==> [ :array | self parameterKeyFrom: array ]