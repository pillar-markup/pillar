tests - Format
testStrikethroughFormat
	super testStrikethroughFormat.
	self assert: result equals: (PRStrikethroughFormat with: (PRText content: 'Foo'))