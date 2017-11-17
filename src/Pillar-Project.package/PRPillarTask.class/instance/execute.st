execution
execute
	
	self needsToReexecute
		ifTrue: [ self doExecute ].
	^ self result