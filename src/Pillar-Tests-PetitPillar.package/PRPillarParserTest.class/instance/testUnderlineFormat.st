tests - Format
testUnderlineFormat
	super testUnderlineFormat.
	self assert: result equals: (PRUnderlineFormat with: (PRText content: 'Foo')).
	self assertStart: 1 stop: 7.
	self assertStart: 3 stop: 5 ofNode: result children first.