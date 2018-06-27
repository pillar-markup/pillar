grammar - Parameter
parameterUntilNewline
	^ super parameterUntilNewline ==> [ :array |
		(PRParameter keyNode: array second valueNode: array third)
			start: array first start;
			stop: array last stop ]