tests
testReadingLevel3
	| dictionary config |
	dictionary := Dictionary
		with: 'level3' -> (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number').
	config := self configurationClass newFromDictionary: dictionary.
	self
		assert: config level3
		equals:
			((PRLevelNumberConfiguration with: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number'))
				configuration: config;
				level: 3;
				yourself)