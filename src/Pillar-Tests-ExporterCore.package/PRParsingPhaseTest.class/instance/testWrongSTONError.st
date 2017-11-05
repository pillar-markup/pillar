tests
testWrongSTONError
	| file configuration |
	file := FileSystem workingDirectory / 'foo.pillar'.
	file writeStreamDo: [ :stream | stream nextPutAll: '{"title"="titre"}' ].
	configuration :=  self configurationClass  new
		baseDirectory: FileSystem workingDirectory;
		yourself.
	self
		should: [ self actualClass new parseFile: configuration baseDirectory / 'foo.pillar' ]
		raise: STONReaderError
		whoseDescriptionIncludes: 'foo.pillar'
		description: 'foo.pillar'.
	(FileSystem workingDirectory / 'foo.pillar') ensureDelete