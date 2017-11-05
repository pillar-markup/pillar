accessing
executeOn: aPillarContext
	self new
		configuration: aPillarContext configuration;
		anchorsMapping: (aPillarContext propertyAt: #anchorsMapping);
		start: aPillarContext input.
	^ aPillarContext