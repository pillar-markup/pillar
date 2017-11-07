tests
testEnsureNewFileWhenExporting
	| configuration phase document pillarContext |
	FileSystem workingDirectory / 'foo.html' writeStreamDo: [ :stream | stream nextPutAll: 'some very long string' ].
	configuration := self fromString: '{ #outputFile: "foo.html", #outputType: "html" }'.
	phase := self actualClass new configuration: configuration.
	
	document := PRDocument new
		add: (PRText content: 'short');
		yourself.
	pillarContext := PRCompilationContext withDocument: document withConfiguration: configuration.
	phase exportInput: pillarContext.
	self assert: (FileSystem workingDirectory / 'foo.html') readStream contents asString equals: 'short'.
	(FileSystem workingDirectory / 'foo.html') ensureDelete