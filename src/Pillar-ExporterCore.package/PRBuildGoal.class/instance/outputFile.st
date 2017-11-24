building
outputFile

	| outputDirectory extension relativePath |
	outputDirectory := project configuration outputDirectory  / target outputDirectoryName.
	extension := target extension.
	relativePath := input file path
		relativeTo: project configuration baseDirectory path.
	^ ((outputDirectory resolve: relativePath parent) / relativePath basename), extension.