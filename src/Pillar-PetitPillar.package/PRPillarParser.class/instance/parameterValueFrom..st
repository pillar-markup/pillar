grammar - Parameter
parameterValueFrom: array
	^ (PRParameterValue value: (self literalFrom: array third))
		start: array second start;
		stop: array last stop