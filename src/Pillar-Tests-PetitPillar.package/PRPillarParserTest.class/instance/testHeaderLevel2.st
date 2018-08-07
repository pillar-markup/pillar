tests - Header
testHeaderLevel2
	super testHeaderLevel2.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 2).
	self assertStart: 1 stop: 5.
	self assertStart: 3 stop: 5 ofNode: result children first.