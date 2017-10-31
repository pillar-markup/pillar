tests
testCounter
	| config |
	config := self configurationClass new.
	self
		addHeader: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'roman')
		ofLevel: 1
		to: config.
	self
		addHeader: (Dictionary with: 'numbering' -> true with: 'size' -> 0 with: 'renderAs' -> 'letter')
		ofLevel: 2
		to: config.
	self
		addHeader: (Dictionary with: 'numbering' -> true with: 'size' -> 3 with: 'renderAs' -> 'letter')
		ofLevel: 3
		to: config.
	self assert: (config level3 printCounter: self counterLevel3) equals: 'I.c'