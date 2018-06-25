tests - Header
testHeaderWithFormat
	super testHeaderWithFormat.
	self 
		assert: result 
		equals: (PRHeader withAll: {PRBoldFormat with: (PRText content: 'Foo')} level: 1).
	self assertStart: 1 stop: 8.
	self assertStart: 2 stop: 8 ofNode: result children first.
	self assertStart: 4 stop: 6 ofNode: result children first children first.