grammar - Parameter
parameterUntilNewline
	^ super parameterUntilNewline "==>
			[ :array | self parameterFrom: array ]"