tests
testReadingSlideInTemplateForDeckJS
	| dictionary config |
	dictionary := Dictionary with: 'slideInTemplateForDeckJS' -> 3.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config slideInTemplateForDeckJS equals: 3