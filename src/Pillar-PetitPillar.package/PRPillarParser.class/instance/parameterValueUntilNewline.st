grammar - Parameter
parameterValueUntilNewline
	^ super parameterValueUntilNewline ==> [ :array | 
		(PRParameterValue value: (self stringFrom: array second))
			start: array first start;
			stop: array last stop ]