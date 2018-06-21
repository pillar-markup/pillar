visiting
createTestMethodFrom: aCodeblock
	
	(self class environment at: fileName asSymbol) compile: 'test' , cbIndex asString,'
	
	self assert: (' , aCodeblock text withSeparatorsCompacted, ') isPaired'