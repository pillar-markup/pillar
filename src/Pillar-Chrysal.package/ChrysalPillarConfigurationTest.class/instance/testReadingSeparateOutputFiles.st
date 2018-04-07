tests - from cocoon
testReadingSeparateOutputFiles
	| dictionary config |
	dictionary := Dictionary with: 'separateOutputFiles' -> false.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config separateOutputFiles equals: false