tests
testReadingDisableTransformers
	| dictionary config |
	dictionary := Dictionary with: 'disableTransformers' -> (Array with: 'foo' with: 'bar').
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config disableTransformers equals: (Array with: 'foo' with: 'bar')