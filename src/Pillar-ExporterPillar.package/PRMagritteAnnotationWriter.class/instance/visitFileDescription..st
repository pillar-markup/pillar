visiting-description
visitFileDescription: aDescription
	self tryToAddFrom: aDescription withInterpretation: [ :value | (value relativeTo: FileSystem workingDirectory) printWithDelimiter: $/ ]