executing
executeOn: aPRCompilationContext
	destinationDirectory exists
		ifTrue: [ ^ self ].
	destinationDirectory ensureCreateDirectory.
	sourceDirectory copyAllTo: destinationDirectory.
	^ self