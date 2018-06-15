visiting
createTestMethodFrom: aCodeblock
	
	fileName asClass compile: 'test' , cbIndex asString,'
	
	self assert: ' , aCodeblock text , ' evaluate isPaired'