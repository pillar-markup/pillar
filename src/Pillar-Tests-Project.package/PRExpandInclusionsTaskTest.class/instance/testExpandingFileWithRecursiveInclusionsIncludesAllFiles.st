tests
testExpandingFileWithRecursiveInclusionsIncludesAllFiles

	| task document fileSystem topFileReference includedFileReference secondLevelIncludeFileReference |
	fileSystem := FileSystem memory.
	topFileReference := fileSystem root / 'topFile'.
	includedFileReference := fileSystem root / 'include'.
	includedFileReference writeStreamDo: [ :stream | stream nextPutAll: '${inputFile:secondLevelInclude}$' ].
	secondLevelIncludeFileReference := fileSystem root / 'secondLevelInclude'.
	secondLevelIncludeFileReference writeStreamDo: [ :stream | stream nextPutAll: 'foo' ].

	document := PRDocument new.
	document add: (PRInputFileAnnotation value: 'include').
	
	task := PRExpandInclusionsTask new.
	task goal: (PRBuildGoal new
		inputDocument: (PRInputDocument new file: topFileReference; yourself)).
	task pillarDocumentDependency: (PRGenericObjectTask result: document).
	
	task execute.
	
	
	self assert: document children first equals: (PRDocument parser parse: (secondLevelIncludeFileReference readStreamDo: [:stream | stream contents ])) children first