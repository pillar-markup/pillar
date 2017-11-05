tests
testSizeIsNotTheFullSizePossible
	| config |
	config := self configurationClass new.
	self
		addHeader: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'roman')
		ofLevel: 1
		to: config.
	self
		addHeader: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number')
		ofLevel: 2
		to: config.
	self assert: (config level1 printCounter: #(1)) equals: 'I'.
	self assert: (config level2 printCounter: #(1 1)) equals: '1'