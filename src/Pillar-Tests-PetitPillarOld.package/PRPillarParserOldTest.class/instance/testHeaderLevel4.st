tests - Header
testHeaderLevel4
	super testHeaderLevel4.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 4)