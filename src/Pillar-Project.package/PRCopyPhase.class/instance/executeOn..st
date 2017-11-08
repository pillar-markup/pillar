executing
executeOn: aPRCompilationContext 
	
	| outputFormat destinationDirectory |
	outputFormat := self configuration propertyAt: #_outputFormat.
	destinationDirectory := aPRCompilationContext configuration outputDirectory  / outputFormat outputDirectoryName resolve: (Path from: directory).

	destinationDirectory
		exists ifTrue: [ ^ aPRCompilationContext ].

	
	destinationDirectory
		ensureCreateDirectory.

	aPRCompilationContext configuration baseDirectory / directory
		copyAllTo: destinationDirectory.
		
	^ aPRCompilationContext