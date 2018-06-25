tests - Header
testHeaderLevel3
	super testHeaderLevel3.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 3).
	self assertStart: 1 stop: 6.
	self assertStart: 4 stop: 6 ofNode: result children first.