tests - from cocoon
testReadingVerbose
	| dictionary config |
	dictionary := Dictionary with: 'verbose' -> false.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: (config propertyAt: #verbose) equals: false