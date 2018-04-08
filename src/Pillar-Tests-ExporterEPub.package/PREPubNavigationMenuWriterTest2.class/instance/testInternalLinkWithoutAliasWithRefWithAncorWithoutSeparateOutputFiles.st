tests
testInternalLinkWithoutAliasWithRefWithAncorWithoutSeparateOutputFiles
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar@foo');
		yourself.
	self assert: (self write: item) isEmpty