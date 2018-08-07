tests - Reference
testAliasLink
	super testAliasLink.
	self assert: result equals: { PRText content: 'Alias' } asOrderedCollection.
	self assertStart: 1 stop: 5 ofNode: result first.