tests
testCapitalizeHeader

	self assert: (self actualClass new capitalizeHeader: 'i am a header') equals: 'I Am A Header'.
	self assert: (self actualClass new capitalizeHeader: 'i am a header of level 1') equals: 'I Am A Header Of Level 1'