tests - Anchor
testAnchorWithSpaceInside
	super testAnchorWithSpaceInside.
	self assert: result equals: (PRAnchor named: 'foo bar')