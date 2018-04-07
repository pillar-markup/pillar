tests
testPrinter
	|  config levels level1 level2 |
	config := self configurationClass newFromDictionary:  (STON fromString: self printerSample).
	levels := config propertyAt: 'levels'. 
	
	level1 := config printer level1.
	self assert: level1 capitalization equals: 'uppercase'.
	self assert: level1 numbering.
	self assert: level1 level equals: 1.
	self assert: level1 size equals: 2.
	self assert: level1 class equals: PRLevelLetterPrinter.
	
	level2 := config printer level2.
	self assert: level2 capitalization equals: 'uppercase'.
	self assert: level2 numbering.
	self assert: level2 level equals: 2.
	self assert: level2 size equals: 3.
	self assert: level2 class equals: PRLevelNumberPrinter.