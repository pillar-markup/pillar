activation
activate
	super activate.
	self
		optionAt: 'from'
		ifPresent: [ :subconf | configuration := configuration subConfigurationNamed: subconf ]
		ifAbsent: [ self errorMissingParameter: 'from' ].
	self generateSummary.
	self exitSuccess