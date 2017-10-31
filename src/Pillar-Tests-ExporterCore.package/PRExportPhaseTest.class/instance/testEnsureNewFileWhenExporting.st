tests
testEnsureNewFileWhenExporting
	| configuration phase |
	FileSystem workingDirectory / 'foo.html' writeStreamDo: [ :stream | stream nextPutAll: 'some very long string' ].
	configuration := self fromString: '{ #outputFile: "foo.html" }'.
	phase := self actualClass new configuration: configuration.
	phase outputStreamDuring: [ :outStream | phase writeOutput: 'short' toStream: outStream ].
	self assert: (FileSystem workingDirectory / 'foo.html') readStream contents asString equals: 'short'.
	(FileSystem workingDirectory / 'foo.html') ensureDelete