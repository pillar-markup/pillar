api
createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments

	| archetype |
	super createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments.
	archetype := arguments at: 'template' ifAbsent: [ 'book' ].							
	archetype := FileLocator imageDirectory / 'archetypes' / archetype.
	archetype exists ifFalse: [
		self error: 'Archetype ', archetype, ' does not exist'
	].
	archetype copyAllTo: configuration baseDirectory