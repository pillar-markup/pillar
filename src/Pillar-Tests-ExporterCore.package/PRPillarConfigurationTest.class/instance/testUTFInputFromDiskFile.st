tests
testUTFInputFromDiskFile
	| fileName file output expected |
	fileName := UUID new asString , '.pillar'.
	file := FileSystem disk workingDirectory / fileName.
	file
		writeStreamDo: [ :input | 
			| znWriteStream |
			znWriteStream := ZnCharacterWriteStream on: input binary.
			znWriteStream nextPutAll: self someUnicodeString ].
	output := String
		streamContents: [ :s | 
			 self configurationClass new
				inputFile: file;
				outputStream: s;
				outputType: PRTextWriter;
				propertyAt: #_outputFormat put: PRTextWriter new;
				disabledPhases: { #templating };
				export ].
	
	expected := self someUnicodeString.
		
	file ensureDelete.
	self assert: output equals: expected contents