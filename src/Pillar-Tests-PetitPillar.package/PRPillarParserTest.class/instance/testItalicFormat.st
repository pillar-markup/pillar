tests - Format
testItalicFormat
	super testItalicFormat.
	self assert: result equals: (PRItalicFormat with: (PRText content: 'Foo'))