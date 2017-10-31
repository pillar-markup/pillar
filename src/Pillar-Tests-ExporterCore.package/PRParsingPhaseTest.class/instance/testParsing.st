tests
testParsing
	| ston configuration |
	ston := '{ #inputFile : "fileForTest1.pillar" }'.
	FileSystem workingDirectory / 'fileForTest1.pillar'
		writeStreamDo: [ :stream | stream nextPutAll: 'foo' ].
	configuration := (self fromString: ston)
		baseDirectory: FileSystem workingDirectory;
		yourself.
	self
		assert:
			(self actualClass
				executeOn:
					(PRCompilationContext
						withDocument: configuration inputFile
						withConfiguration: configuration)) input
		equals:
			(PRDocument new
				add: (PRParagraph new add: (PRText content: 'foo'));
				yourself).
	(FileSystem workingDirectory / 'fileForTest1.pillar') ensureDelete