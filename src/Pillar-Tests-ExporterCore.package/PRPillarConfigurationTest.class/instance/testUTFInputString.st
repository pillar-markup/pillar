tests
testUTFInputString
	| output expected |
	output := String
		streamContents: [ :s | 
			self configurationClass new
				inputString: self someUnicodeString;
				outputType: PRTextWriter;
				outputStream: s;
				propertyAt: #_outputFormat put: PRTextWriter new;
				disabledPhases: {#templating};
				export ].
	expected := self someUnicodeString.
	self assert: output equals: expected contents