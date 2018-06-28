grammar - Parameter
parameterValueUntilEndLink
	^ super parameterValueUntilEndLink ==> [ :array | self stringFrom: array third ]