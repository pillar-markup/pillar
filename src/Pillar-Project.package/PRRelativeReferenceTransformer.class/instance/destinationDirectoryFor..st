accessing
destinationDirectoryFor: aPRCompilationContext 
	
	| filePath relativePath outputFormat |
	destinationDirectory ifNotNil: [ ^ destinationDirectory ].
	
	filePath := aPRCompilationContext configuration input file parent.
	relativePath := filePath relativeTo: aPRCompilationContext configuration baseDirectory.
	outputFormat := goal target.
	^ aPRCompilationContext configuration outputDirectory  / outputFormat outputDirectoryName resolve: relativePath.