accessing
destinationDirectoryFor: aDocument 
	
	| filePath relativePath |
	filePath := inputFile parent.
	relativePath := filePath relativeTo: baseDirectory.
	^ outputDirectory resolve: relativePath.