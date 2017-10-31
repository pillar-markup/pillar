tests
testDefaultConfigurationsExistsWithOthersConfigurations
	"I check that, when womeone creatd a new subconfiguration, the defaults configurations still exists."

	| ston output expected |
	ston := '{
		"support": [  ],
		"configurations":{
			"foo": { 
				"outputType": #mock
			 }
		}
}'.
	output := ('' writeStream).
	expected := ('' writeStream) << '{'; << '"content":"Test"'; << '}'.
	
	( self configurationClass  newFromString: ston)
		inputString: 'Test';
		outputStream: output;
		export: 'mock'.
	self assert: output contents equals: (expected contents)