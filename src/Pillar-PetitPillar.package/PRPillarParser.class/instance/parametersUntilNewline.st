grammar - Parameter
parametersUntilNewline
	^ super parametersUntilNewline ==> [ :array |
		(PRParameters with: array second withAll: array third)
			start: array first start;
			stop: array last stop ]