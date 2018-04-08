accessing
createConfigurationFrom: aPRProject
	^ aPRProject configuration class new
		propertyAt: #_outputFormat put: self;
		parent: aPRProject configuration;
		yourself