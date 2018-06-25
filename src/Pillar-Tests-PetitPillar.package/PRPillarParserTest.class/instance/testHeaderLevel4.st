tests - Header
testHeaderLevel4
	super testHeaderLevel4.
	self assert: result equals: (PRHeader withAll: {PRText content: 'Foo'} level: 4).
	self assertStart: 1 stop: 7.
	self assertStart: 5 stop: 7 ofNode: result children first.