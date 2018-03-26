tests
testSize
	| config |
	config := self configurationClass new.
	self
		addHeader: (Dictionary with: 'numbering' -> true with: 'size' -> 1 with: 'renderAs' -> 'roman')
		ofLevel: 1
		to: config.
	self
		addHeader: (Dictionary with: 'numbering' -> true with: 'size' -> 0 with: 'renderAs' -> 'number')
		ofLevel: 2
		to: config.
	self
		addHeader: (Dictionary with: 'numbering' -> true with: 'size' -> 3 with: 'renderAs' -> 'letter')
		ofLevel: 3
		to: config.
	self assert: (config level3 printCounter: #(1 -1 1)) equals: 'I.a'.
	config level2 numbering: true.
	config level2 size: 2.
	self assert: (config level3 printCounter: #(1 1 1)) equals: 'I.1.a'