tests
testReadingInputFile
	| dictionary config fileSystem |
	fileSystem := FileSystem memory root.
	fileSystem / 'test.txt' writeStreamDo: [ :st | st nextPutAll: 'bar' ].
	dictionary := Dictionary
		with: 'baseDirectory' -> fileSystem
		with: 'inputFile' -> 'test.txt'.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config inputFile contents equals: 'bar'