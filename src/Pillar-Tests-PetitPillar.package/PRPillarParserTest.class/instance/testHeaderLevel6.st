tests - Header
testHeaderLevel6
	super testHeaderLevel6.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 6)