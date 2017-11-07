tests
testUTFInputFromMemoryFile
	
	| fileName file output expected |
	
	fileName := UUID new asString, '.pillar'.
	file := FileSystem memory workingDirectory / fileName.

	file writeStreamDo: [ :input |
		| znWriteStream |
		znWriteStream := ZnCharacterWriteStream on: input binary.
		znWriteStream nextPutAll: self someUnicodeString ].

	output := String streamContents: [ :s |
		 self configurationClass new
			inputFile: file;
			outputType: PRTextWriter;
			outputStream: s;
			disabledPhases: {#templating};
			export.
	].
	
	file ensureDelete.
	
	expected := self someUnicodeString.
	
	self assert: output equals: expected contents.