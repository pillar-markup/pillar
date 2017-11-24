tests
testSaveTaskWritesOutput

	| task fs outputFile text |
	fs := FileSystem memory.
	outputFile := fs root / 'test.txt'.
	text := 'some text'.
	
	task := PRSaveTask new.
	task outputDocumentDependency: (PRGenericObjectTask result: (PROutputDocument new outputText: text)).
	task outputFile: outputFile.
	
	task execute.
	
	self assert: (outputFile readStreamDo: [ :stream | stream contents ]) equals: text