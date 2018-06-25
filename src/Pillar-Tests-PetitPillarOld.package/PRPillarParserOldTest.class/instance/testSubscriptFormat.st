tests - Format
testSubscriptFormat
	super testSubscriptFormat.
	self assert: result equals: (PRSubscriptFormat with: (PRText content: 'Foo'))