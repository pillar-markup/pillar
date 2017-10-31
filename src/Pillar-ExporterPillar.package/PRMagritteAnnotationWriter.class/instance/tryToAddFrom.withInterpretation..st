visiting-description
tryToAddFrom: aDescription withInterpretation: aBlock
	"I take a Description, check if an object of the dictionary match with the description, if I find one, I interpret it and add it to the new dictionary."

	| accessor |
	accessor := aDescription accessor selector.
	annotation parameters
		at: accessor
		ifPresent:
			[ :value | 
			aDescription validate: value.
			(annotation hadAllKeys
				or:
					[ (annotation class defaultParameterName = accessor) not ])
				ifTrue:
					[ 
					stream
						nextPutAll: accessor;
						nextPutAll: PRPillarParser defaultMarkupParameterValue ].
			stream nextPutAll: (aBlock value: value).
			annotation parameters removeKey: accessor.
			annotation hasParameters
				ifTrue:
					[ stream nextPutAll: PRPillarParser defaultMarkupParameter ] ]