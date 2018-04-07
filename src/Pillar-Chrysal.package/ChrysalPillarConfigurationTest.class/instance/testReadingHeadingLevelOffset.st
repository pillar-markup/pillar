tests - from cocoon
testReadingHeadingLevelOffset
	| dictionary config |
	dictionary := Dictionary with: 'headingLevelOffset' -> 1.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config headingLevelOffset equals: 1