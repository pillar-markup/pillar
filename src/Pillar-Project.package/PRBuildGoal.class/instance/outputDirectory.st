accessing
outputDirectory
	
	| relativeInputPath |
	relativeInputPath := input file parent path relativeTo: project baseDirectory absolutePath.
	^ (project outputDirectory / target outputDirectoryName) resolve: relativeInputPath