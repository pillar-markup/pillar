accessing
configuration
	^ configuration ifNil: [ configuration := ConfigurationForPillar new ]