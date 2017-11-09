tests
testTransformerCanBeDisable
	| configuration input output expected |
	input := 'Foo'.
	output := WriteStream on: String new.
	configuration :=  self configurationClass  new
		inputString: input;
		outputStream: output;
		outputType: PRMockWriter;
		propertyAt: #_outputFormat put: PRMockWriter new;
		disabledPhases: { #templating . #mock };
		export.
	
	self assert: output contents equals: input