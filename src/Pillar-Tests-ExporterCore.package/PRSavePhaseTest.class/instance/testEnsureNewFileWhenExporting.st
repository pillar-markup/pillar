tests
testEnsureNewFileWhenExporting
	| configuration phase outputFormat outputDirectory |
	
	outputFormat := PRHtmlOutput new.
	outputDirectory := FileSystem workingDirectory / '__test'.
	
	configuration := self fromString: '{ #outputFile: "foo.html" }'.
	configuration propertyAt: #_outputFormat put: outputFormat.
	configuration propertyAt: #input put: (PRInputDocument new file: FileSystem workingDirectory / 'foo'; yourself).
	configuration outputDirectory: outputDirectory.
	
	(outputDirectory / outputFormat outputDirectoryName) ensureCreateDirectory.
	(outputDirectory / outputFormat outputDirectoryName / 'foo.html')
		writeStreamDo: [ :stream | stream nextPutAll: 'some very long string' ].
	
	phase := self actualClass new configuration: configuration.
	phase exportInput: (PRCompilationContext withDocument: (PROutputDocument new outputText: 'short') withConfiguration: configuration).
	
	self
		assert: (outputDirectory / outputFormat outputDirectoryName / 'foo.html') readStream contents asString
		equals: 'short'.
	
	(outputDirectory / outputFormat outputDirectoryName / 'foo.html') ensureDelete.
	outputDirectory ensureDeleteAll.