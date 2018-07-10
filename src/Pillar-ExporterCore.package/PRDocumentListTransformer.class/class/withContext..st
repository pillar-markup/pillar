instance-creation
withContext: aContext

	| inst |
	inst := super withContext: aContext.
	context := aContext.
	inst workingDirectory: aContext baseDirectory.
	^ inst