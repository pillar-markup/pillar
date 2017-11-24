accessing
outputDirectory
	
	| relativeInputPath |
	relativeInputPath := input file parent path relativeTo: project baseDirectory absolutePath.
	^ self targetOutputDirectory resolve: relativeInputPath