tests
testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithSeparateOutputFiles
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar');
		yourself.
	self assert: (self writeWithSeparateOutputFiles: item) isEmpty