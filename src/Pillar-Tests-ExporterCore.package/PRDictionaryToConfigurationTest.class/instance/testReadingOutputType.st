tests
testReadingOutputType
	| dictionary config |
	dictionary := Dictionary with: 'outputType' -> 'html'.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config outputType equals: PRHTMLWriter