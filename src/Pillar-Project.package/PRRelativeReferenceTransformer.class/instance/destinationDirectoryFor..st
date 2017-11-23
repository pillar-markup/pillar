accessing
destinationDirectoryFor: aDocument 
	
	| filePath relativePath outputFormat |
	destinationDirectory ifNotNil: [ ^ destinationDirectory ].
	
	filePath := goal inputDocument file parent.
	relativePath := filePath relativeTo: goal project configuration baseDirectory.
	outputFormat := goal target.
	^ goal project configuration outputDirectory  / outputFormat outputDirectoryName resolve: relativePath.