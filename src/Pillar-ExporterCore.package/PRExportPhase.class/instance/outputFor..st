actions
outputFor: file
	^ self configuration outputDirectory
		resolve: (file relativeTo: self configuration baseDirectory) 