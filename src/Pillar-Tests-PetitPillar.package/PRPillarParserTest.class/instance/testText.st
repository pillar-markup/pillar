tests - Anchor
testText
	super testText.
	self assert: result equals: (PRText content: 'Foo').
	self assertStart: 1 stop: 3.