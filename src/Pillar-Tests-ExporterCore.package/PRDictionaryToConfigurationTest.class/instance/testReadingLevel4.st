tests
testReadingLevel4
	| dictionary config |
	dictionary := Dictionary
		with: 'level4' -> (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number').
	config := self configurationClass newFromDictionary: dictionary.
	self
		assert: config level4
		equals:
			((PRLevelNumberConfiguration with: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number'))
				configuration: config;
				level: 4;
				yourself)