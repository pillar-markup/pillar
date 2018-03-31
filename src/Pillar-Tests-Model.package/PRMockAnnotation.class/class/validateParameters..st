instance creation
validateParameters: parameters

	super validateParameters: parameters.
	parameters
		at: 'number'
		ifPresent: [ :v | parameters at: 'number' put: v asNumber ]
	