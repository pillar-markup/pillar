instance-creation
executeOn: aPillarContext
	self new
		configuration: aPillarContext configuration;
		start: aPillarContext input.
	^ aPillarContext