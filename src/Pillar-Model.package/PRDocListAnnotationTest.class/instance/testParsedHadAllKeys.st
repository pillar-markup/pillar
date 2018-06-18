helpers
testParsedHadAllKeys

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation path equals: 'blogs'.
	self assert: annotation limit equals: '10'.
	self assert: annotation sort equals: 'date'