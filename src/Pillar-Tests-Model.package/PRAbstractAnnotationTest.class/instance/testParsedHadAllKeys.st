tests
testParsedHadAllKeys

	self assert: (self parser parse:  '${' , self referenceString , '}$') children first children first hadAllKeys