tests ok in chrysal too
testReadingSeparateOutputFiles
	| dictionary config |
	dictionary := Dictionary with: 'separateOutputFiles' -> false.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config separateOutputFiles equals: false