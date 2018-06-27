grammar - Parameter
parameterValueFrom: array
	^ (PRParameterValue value: (self stringFrom: array third))
		start: array second start;
		stop: array last stop