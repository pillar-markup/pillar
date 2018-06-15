visiting
createTestMethodFrom: aCodeblock

	className compile: 'test', cbIndex asString, '
	self assert:',aCodeblock text,'evaluate isPaired'
	
		