tests
testWrongTagError
	| file configuration |
	file := FileSystem workingDirectory / 'foo.pillar'.
	file writeStreamDo: [ :stream | stream nextPutAll: '${wrongTag}$' ].
	configuration :=  self configurationClass  new
		baseDirectory: FileSystem workingDirectory;
		yourself.
	self
		should: [ self actualClass new parseFile: configuration baseDirectory / 'foo.pillar' ]
		raise: PRError
		whoseDescriptionIncludes: 'foo.pillar'
		description: 'foo.pillar'.
	(FileSystem workingDirectory / 'foo.pillar') ensureDelete