tests
testInternalLinkWithAliasWithRefWithAncorWithoutSeparateOutputFiles
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self assert: (self write: item) isEmpty