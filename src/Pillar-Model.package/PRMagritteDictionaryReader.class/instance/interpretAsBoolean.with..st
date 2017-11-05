action
interpretAsBoolean: value with: aDescription
	'true' = value
		ifTrue: [ ^ true ].
	'false' = value
		ifTrue: [ ^ false ].
	PRError
		signal: aDescription accessor readSelector , ' must be a boolean in ' , class tag , ' annotation. Receive : ' , value