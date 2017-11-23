tests
testInclufingFileWithFigureReferenceExpandsReferenceRelativeToParent

	| task document fileSystem topFileReference includedFileReference paragraph figure |
	fileSystem := FileSystem memory.
	topFileReference := fileSystem root / 'topFile'.
	includedFileReference := fileSystem root / 'inner' / 'include'.
	includedFileReference parent ensureCreateDirectory.
	includedFileReference writeStreamDo: [ :stream | stream nextPutAll: '+Pillar logo>figures/pillar.png|width=30+' ].

	document := PRDocument new.
	document add: (PRInputFileAnnotation value: 'inner/include').
	
	task := PRExpandInclusionsTask new.
	task inputFile: topFileReference.
	task pillarDocumentDependency: (PRGenericObjectTask result: document).
	
	task execute.
	
	paragraph := document children first.
	figure := paragraph children first.
	self assert: (fileSystem root resolve: figure reference) equals: fileSystem root / 'inner' / 'figures' / 'pillar.png'