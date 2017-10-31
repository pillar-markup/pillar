tests - Header
testHeaderLevel3
	super testHeaderLevel3.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 3)