tests - Header
testHeaderLevel1
	super testHeaderLevel1.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 1)