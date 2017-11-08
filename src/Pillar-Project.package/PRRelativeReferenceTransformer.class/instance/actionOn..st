actions
actionOn: aPRCompilationContext 

	| filePath relativePath outputFormat destinationDirectory |
	filePath := aPRCompilationContext configuration input file parent.
	relativePath := filePath relativeTo: configuration baseDirectory.
	outputFormat := self configuration propertyAt: #_outputFormat.
	destinationDirectory := aPRCompilationContext configuration outputDirectory  / outputFormat outputDirectoryName resolve: relativePath.
	PRUpdateFileInclusionReference
		start: aPRCompilationContext input
		with: destinationDirectory fullName.
	^ aPRCompilationContext