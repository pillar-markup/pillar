tests - Format
testBoldFormat
	super testBoldFormat.
	self assert: result equals: (PRBoldFormat with: (PRText content: 'Foo'))