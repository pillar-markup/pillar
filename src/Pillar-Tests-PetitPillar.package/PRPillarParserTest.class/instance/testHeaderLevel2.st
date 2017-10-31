tests - Header
testHeaderLevel2
	super testHeaderLevel2.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 2)