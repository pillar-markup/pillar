tests
testUTFInputString
	| output expected |
	output := String
		streamContents: [ :s | 
			self configurationClass new
				inputString: self someUnicodeString;
				outputType: PRTextWriter;
				outputStream: s;
				disabledPhases: {#templating};
				export ].
	expected := self someUnicodeString.
	self assert: output equals: expected contents