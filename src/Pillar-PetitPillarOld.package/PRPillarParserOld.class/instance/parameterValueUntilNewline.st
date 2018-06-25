grammar - Parameter
parameterValueUntilNewline
	^ super parameterValueUntilNewline ==> [ :array | self stringFrom: array ]