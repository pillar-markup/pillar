tests - Reference
testAliasLinkEscape
	super testAliasLinkEscape.
	self assert: result equals: { PRText content: 'Alias>' }