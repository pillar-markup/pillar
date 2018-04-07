tests - from cocoon
testReadingScrambledEmailAddresses
	| dictionary config |
	dictionary := STON fromStream: '{ "scrambledEmailAddresses" : true }' readStream.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config scrambledEmailAddresses equals: true