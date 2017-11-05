tests - Text
testRaw
	super testRaw.
	self assert: result equals: (PRRaw content: 'foo' type: 'mock' )