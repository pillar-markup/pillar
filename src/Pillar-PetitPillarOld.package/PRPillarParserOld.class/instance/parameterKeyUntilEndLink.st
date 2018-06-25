grammar - Parameter
parameterKeyUntilEndLink
	^ super parameterKeyUntilEndLink ==> [ :array | self stringFrom: array ]