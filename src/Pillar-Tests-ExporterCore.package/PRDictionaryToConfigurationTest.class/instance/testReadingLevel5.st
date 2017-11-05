tests
testReadingLevel5
	| dictionary config |
	dictionary := Dictionary
		with: 'level5' -> (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number').
	config := self configurationClass newFromDictionary: dictionary.
	self
		assert: config level5
		equals:
			((PRLevelNumberConfiguration with: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number'))
				configuration: config;
				level: 5;
				yourself)