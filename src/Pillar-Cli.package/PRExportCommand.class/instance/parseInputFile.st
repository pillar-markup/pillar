parsing
parseInputFile
	| inputFile inputFileName |
	self configuration properties ifEmpty: [ ^ self ].
	inputFileName := self configuration properties at: 'inputFile' ifAbsent: [ Error signal: 'No input file' ].
	self flag: #fixme.
	"the input file is already a file"
	inputFile := self configuration baseDirectory resolve: inputFileName.
	inputFile exists
		ifFalse: [ self exitFailure: '"' , inputFile pathString , '" does not exist' ].
	configuration inputFile: inputFile