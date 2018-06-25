tests - Header
testHeaderWithFormat
	super testHeaderWithFormat.
	self assert: result equals: (PRHeader withAll: {PRBoldFormat with: (PRText content: 'Foo')} level: 1)