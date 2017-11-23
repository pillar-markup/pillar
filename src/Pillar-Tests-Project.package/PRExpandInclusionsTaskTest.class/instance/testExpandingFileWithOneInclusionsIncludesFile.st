tests
testExpandingFileWithOneInclusionsIncludesFile

	| task document fileSystem topFileReference includedFileReference |
	fileSystem := FileSystem memory.
	topFileReference := fileSystem root / 'topFile'.
	includedFileReference := fileSystem root / 'include'.
	includedFileReference writeStreamDo: [ :stream | stream nextPutAll: 'foo' ].
	
	document := PRDocument new.
	document add: (PRInputFileAnnotation value: 'include').
	
	task := PRExpandInclusionsTask new.
	task goal: (PRBuildGoal new
		inputDocument: (PRInputDocument new file: topFileReference; yourself)).
	task pillarDocumentDependency: (PRGenericObjectTask result: document).
	
	task execute.
	
	
	((PRDocument parser parse: includedFileReference readStream) children) withIndexDo: [ :child :index |
		self assert: (document children at: index) equals: child
	]