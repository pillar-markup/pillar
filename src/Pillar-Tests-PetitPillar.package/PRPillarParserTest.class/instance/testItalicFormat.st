tests - Format
testItalicFormat
	super testItalicFormat.
	self assert: result equals: (PRItalicFormat with: (PRText content: 'Foo')).
	self assertStart: 1 stop: 7.
	self assertStart: 3 stop: 5 ofNode: result children first.