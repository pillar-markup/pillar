tests
testCapitalizeEnglish

	self assert: (self actualClass new capitalizeEnglish: 'i am a header') equals: 'I Am a Header'.
	self assert: (self actualClass new capitalizeEnglish: 'i am a header of level 1') equals: 'I Am a Header of Level 1'.
	self assert: (self actualClass new capitalizeEnglish: 'i like to code in Pharo for a long time') equals: 'I Like to Code in Pharo for a Long Time'.