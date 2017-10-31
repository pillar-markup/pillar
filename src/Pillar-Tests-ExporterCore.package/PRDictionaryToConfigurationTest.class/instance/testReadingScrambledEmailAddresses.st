tests
testReadingScrambledEmailAddresses
	| dictionary config |
	dictionary := Dictionary with: 'scrambledEmailAddresses' -> false.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config scrambledEmailAddresses equals: false