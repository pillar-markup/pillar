grammar - Parameter
parameterValueUntilEndAnnotation
	^ super parameterValueUntilEndAnnotation ==> [ :array | self stringFrom: array ]