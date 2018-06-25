tests - Anchor
testAnchorWithNewLine
	super testAnchorWithNewLine.
	self assert: result equals: (PRAnchor named: 'foo')