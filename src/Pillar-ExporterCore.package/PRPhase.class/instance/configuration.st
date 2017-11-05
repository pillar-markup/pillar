accessing
configuration
	^ configuration isNotNil
		ifTrue: [ configuration ]
		ifFalse: [ PRPillarConfiguration new ]