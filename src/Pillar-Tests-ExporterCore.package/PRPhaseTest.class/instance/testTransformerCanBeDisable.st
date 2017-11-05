tests
testTransformerCanBeDisable
	| configuration input output expected |
	input := 'Foo'.
	output := WriteStream on: String new.
	configuration :=  self configurationClass  new
		inputString: input;
		outputStream: output;
		outputType: PRMockWriter;
		disabledPhases: (Array with: 'mock');
		export.
	
	expected := self jsonStreamWithContent: 'Foo'.
	self assert: (Json readFrom: output contents readStream) equals: (Json readFrom: expected contents readStream).