actions
actionOn: aPRCompilationContext 

	PRUpdateFileInclusionReference
		start: aPRCompilationContext input
		with: (self destinationDirectoryFor: aPRCompilationContext) fullName.
	^ aPRCompilationContext