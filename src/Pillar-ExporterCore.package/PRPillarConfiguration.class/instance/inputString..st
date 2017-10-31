accessing
inputString: aString
	"I transform aString as a File and I add it to the properties"
	
	| inputFile |
	self baseDirectory: FileSystem memory root.
	inputFile := self baseDirectory / 'input.conf'.
	inputFile writeStreamDo: [ :stream | 
		| znWriteStream |
		znWriteStream := ZnCharacterWriteStream on: stream binary.
		znWriteStream nextPutAll: aString ].
	self inputFile: inputFile.