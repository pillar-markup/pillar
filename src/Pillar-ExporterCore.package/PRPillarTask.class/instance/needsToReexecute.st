testing
needsToReexecute

	self isAlreadyDone ifFalse: [ ^ true ].

	^ self dependencies anySatisfy: [ :each |
		each isNewerThan: self modificationTime
	]