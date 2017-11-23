tests
testExpandingFileWithCyclicDependenciesFails

	| task document fileSystem topFileReference includedFileReference |
	fileSystem := FileSystem memory.
	topFileReference := fileSystem root / 'topFile'.
	includedFileReference := fileSystem root / 'included'.
	includedFileReference writeStreamDo: [ :stream | stream nextPutAll: '${inputFile:topFile}$' ].
	
	document := PRDocument new.
	document add: (PRInputFileAnnotation value: 'included').
	
	task := PRExpandInclusionsTask new.
	task inputFile: topFileReference.
	task pillarDocumentDependency: (PRGenericObjectTask result: document).
	
	self should: [ task execute ] raise: PRCyclicFileInclusionError