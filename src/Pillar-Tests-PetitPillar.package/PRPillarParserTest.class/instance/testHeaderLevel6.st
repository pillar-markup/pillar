tests - Header
testHeaderLevel6
	super testHeaderLevel6.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 6).
	self assertStart: 1 stop: 9.
	self assertStart: 7 stop: 9 ofNode: result children first.