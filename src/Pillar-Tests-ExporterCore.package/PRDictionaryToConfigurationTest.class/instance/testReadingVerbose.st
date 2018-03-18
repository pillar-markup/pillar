tests ok in chrysal too
testReadingVerbose
	| dictionary config |
	dictionary := Dictionary with: 'verbose' -> false.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config verbose equals: false