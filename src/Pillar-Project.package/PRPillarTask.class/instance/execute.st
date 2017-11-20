execution
execute
	
	self needsToReexecute
		ifTrue: [ 
			self ensureDependencies.
			self doExecute ].
	^ self result