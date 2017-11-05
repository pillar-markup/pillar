tests
testReadingLevel2
	| dictionary config |
	dictionary := Dictionary
		with: 'level2' -> (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number').
	config := self configurationClass newFromDictionary: dictionary.
	self
		assert: config level2
		equals:
			((PRLevelNumberConfiguration with: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number'))
				configuration: config;
				level: 2;
				yourself)