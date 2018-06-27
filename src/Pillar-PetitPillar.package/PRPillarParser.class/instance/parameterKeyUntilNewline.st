grammar - Parameter
parameterKeyUntilNewline
	^ super parameterKeyUntilNewline ==> [ :array | self stringFrom: array second ]