tests
testPhaseAndTransformersAreCollected
	| configuration input output expected |
	input := 'Foo'.
	output := WriteStream on: String new.
	configuration :=  self configurationClass  new
		inputString: input;
		outputStream: output;
		outputType: PRMockWriter;
		export.
	
	expected := self jsonStreamWithContent: 'FooBarTimoleon'.
	self assert: (Json readFrom: output contents readStream) equals: (Json readFrom: expected contents readStream).