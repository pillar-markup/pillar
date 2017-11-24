tests
testSaveTaskCreatesFile

	| task fs outputFile |
	fs := FileSystem memory.
	outputFile := fs root / 'test.txt'.
	
	task := PRSaveTask new.
	task outputDocumentDependency: (PRGenericObjectTask result: (PROutputDocument new outputText: 'some text')).
	task outputFile: outputFile.
	
	task execute.
	
	self assert: outputFile exists