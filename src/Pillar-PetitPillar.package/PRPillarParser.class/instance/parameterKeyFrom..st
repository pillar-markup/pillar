grammar - Parameter
parameterKeyFrom: array
	^ (PRParameterKey named: (self stringFrom: array second))
		start: array first start;
		stop: array last stop