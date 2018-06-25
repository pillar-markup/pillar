tests - Header
testHeaderLevel5
	super testHeaderLevel5.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 5).
	self assertStart: 1 stop: 8.
	self assertStart: 6 stop: 8 ofNode: result children first.