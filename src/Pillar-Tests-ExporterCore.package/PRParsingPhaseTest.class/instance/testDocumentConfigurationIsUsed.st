tests
testDocumentConfigurationIsUsed
	| configuration ston |
	FileSystem workingDirectory / 'fileForTest2.pillar'
		writeStreamDo: [ :stream | 
			stream
				nextPutAll:
					'{
			"mockProperty":true
		}
		foo' ].
	ston := '{
		"outputType":#mock,
		#inputFile : "fileForTest2.pillar",
		"mockProperty":false
	}'.
	configuration := (self fromString: ston)
		baseDirectory: FileSystem workingDirectory;
		yourself.
	self assert: ((self actualClass executeOn: (PRCompilationContext withDocument: configuration inputFile withConfiguration: configuration)) configuration propertyAt: 'mockProperty').
	(FileSystem workingDirectory / 'fileForTest2.pillar') ensureDelete