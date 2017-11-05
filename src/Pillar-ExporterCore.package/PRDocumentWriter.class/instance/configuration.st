accessing
configuration
	^ configuration ifNil: [ configuration :=PRPillarConfiguration new ]