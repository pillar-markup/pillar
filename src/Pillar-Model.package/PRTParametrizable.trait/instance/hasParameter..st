accessing-parameters
hasParameter: aKey
	self
		parameters at: aKey
		ifAbsent: [ ^ false ].
	^ true