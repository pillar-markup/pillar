tests
testDocumentAreTransformedWithMetadata
  	| configuration input output expected ston expectedJson outputJson |
  	input := 'Foo'.
  	output := '' writeStream.
	
	ston := '{
		"outputType":#mock,
		"metadata": { 
			"title":"Test"
		 }
	}'.
	configuration :=  self configurationClass  newFromString: ston.
	configuration outputStream: output; inputString: input; yourself; export.
	
	expected := self jsonStreamWithContent: 'FooBarTimoleon' withTitle: 'Test'.
	expectedJson := Json readFrom: expected contents readStream.
	outputJson := Json readFrom: output contents readStream.
  	self assert: outputJson equals: expectedJson .