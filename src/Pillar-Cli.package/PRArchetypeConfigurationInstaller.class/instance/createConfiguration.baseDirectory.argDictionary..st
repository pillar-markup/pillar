api
createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments

	| tmp archetype |
	super createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments.
	tmp := (configuration baseDirectory / 'tmp') asFileReference.
	tmp ensureCreateDirectory.
	archetype := arguments 
							at: 'template' 
							ifAbsent: [ 'book' ].
							
	archetype := FileLocator imageDirectory / 'archetypes' / archetype.
	archetype exists ifFalse: [
		self error: 'Archetype ', archetype, ' does not exist'
	].
	archetype copyAllTo: configuration baseDirectory