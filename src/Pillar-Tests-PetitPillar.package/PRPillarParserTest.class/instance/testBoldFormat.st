tests - Format
testBoldFormat
	super testBoldFormat.
	self assert: result equals: (PRBoldFormat with: (PRText content: 'Foo')).
	self assertStart: 1 stop: 7.
	self assertStart: 3 stop: 5 ofNode: result children first.