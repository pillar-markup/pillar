grammar - Parameter
parameterFrom: array
	^ (PRParameter 
			keyNode: array second 
			valueNode: (array third ifNil: [ PRParserUtility newDefaultParameterValue ]))
		start: array first start;
		stop: array last stop