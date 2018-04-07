tests
testPrinter
	|  config levels |
	config := self configurationClass newFromDictionary:  (STON fromString: self printerSample).
	levels := config propertyAt: 'levels'. 
	config printer level1


	self halt. 
	
	
	
	self assert: config printer level1 capitalization equals: 'uppercase'.
	self assert: levels first level equals: 1.
	self assert: levels first size equals: 2.
	self assert: levels first class equals: PRLevelLetterPrinter.
	
	