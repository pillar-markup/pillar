api
createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments

	| tmp archetype |
	super createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments.
	tmp := (configuration baseDirectory / 'tmp') asFileReference.
	tmp ensureCreateDirectory.
	archetype := arguments 
							at: 'template' 
							ifAbsent: [ 'book' ].
	self download: archetype.
	(configuration baseDirectory / (archetype , '.zip')) asFileReference ensureDelete.
	tmp ensureDeleteAll.