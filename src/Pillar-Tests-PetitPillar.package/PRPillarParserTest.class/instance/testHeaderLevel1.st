tests - Header
testHeaderLevel1
	super testHeaderLevel1.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 1).
	self assertStart: 1 stop: 4.
	self assertStart: 2 stop: 4 ofNode: result children first.