execution
execute
	
	self needsToReexecute
		ifTrue: [ 
			self ensureDependencies.
			self result: self doExecute ].
	^ self result