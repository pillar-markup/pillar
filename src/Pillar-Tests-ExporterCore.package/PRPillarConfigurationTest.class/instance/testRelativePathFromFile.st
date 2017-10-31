tests
testRelativePathFromFile
	| configuration |
	FileSystem workingDirectory / 'fileForTest1.pillar' writeStreamDo: [ :stream | stream nextPutAll: 'foo' ].
	configuration :=  self configurationClass  newFromString: '{ #inputFile : "fileForTest1.pillar" }'.
	self assert: configuration inputFile exists.
	(FileSystem workingDirectory / 'fileForTest1.pillar') ensureDelete.