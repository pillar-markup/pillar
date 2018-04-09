accessing
configuration
	^ configuration isNotNil
		ifTrue: [ configuration ]
		ifFalse: [ ConfigurationForPillar new ]