tests
testUTFInputString
	
	| output expected |
	
	output := String streamContents: [ :s |
		 self configurationClass new
			inputString: self someUnicodeString;
			outputType: PRTextWriter;
			outputStream: s;
			export.
	].
	
	expected := self jsonStreamWithContent: (self someUnicodeString ).
	
	self assert: output equals: expected contents.