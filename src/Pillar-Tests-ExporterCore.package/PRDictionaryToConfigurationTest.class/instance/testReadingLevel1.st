tests
testReadingLevel1
	| dictionary config |
	dictionary := Dictionary
		with: 'level1' -> (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number').
	config := self configurationClass newFromDictionary: dictionary.
	self
		assert: config level1
		equals:
			((PRLevelNumberConfiguration with: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number'))
				configuration: config;
				level: 1;
				yourself)