tests
testSaveTaskWritesOutputInUtf8ByDefault

	| task fs outputFile text |
	fs := FileSystem memory.
	outputFile := fs root / 'test.txt'.
	text := 'Příliš žluťoučký kůň úpěl ďábelské ódy.'.
	
	
	task := PRSaveTask new.
	task outputDocumentDependency: (PRGenericObjectTask result: (PROutputDocument new outputText: text)).
	task outputFile: outputFile.
	
	task execute.
	
	"I have to do ugly manipulations of the in-memory file system stream because FileSystem does not support binary streams"
	self assert: (outputFile readStreamDo: [ :stream | 
		(ZnCharacterReadStream on: stream contents asByteArray readStream) contents ]) equals: text