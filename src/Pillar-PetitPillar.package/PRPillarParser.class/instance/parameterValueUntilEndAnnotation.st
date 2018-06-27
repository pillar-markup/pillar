grammar - Parameter
parameterValueUntilEndAnnotation
	^ super parameterValueUntilEndAnnotation ==> [ :array | self parameterValueFrom: array ]