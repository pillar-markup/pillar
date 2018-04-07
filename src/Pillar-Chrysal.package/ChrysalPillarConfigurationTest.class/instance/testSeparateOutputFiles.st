tests - from cocoon
testSeparateOutputFiles
	| dictionary config |
	dictionary := STON
		fromStream: '{  "separateOutputFiles" : false }' readStream.
	config := self configurationClass
		newFromDictionary: dictionary.
	self assert: config separateOutputFiles equals: false
	
