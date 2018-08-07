tests - Reference
testAliasFigureEscape
	super testAliasFigureEscape.
	self assert: result equals: { PRText content: 'Alias>' } asOrderedCollection.
	self assertStart: 1 stop: 7 ofNode: result first.