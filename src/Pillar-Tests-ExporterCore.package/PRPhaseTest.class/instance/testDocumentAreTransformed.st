tests
testDocumentAreTransformed
	| configuration input output |
	input := 'Foo'.
	output := WriteStream on: String new.
	configuration :=  self configurationClass  new
		inputString: input;
		outputStream: output;
		outputType: PRMockWriter;
		propertyAt: #_outputFormat put: PRMockWriter new;
		disabledPhases: { #templating };
		export.

	self assert: output contents equals: 'FooBarTimoleon'.