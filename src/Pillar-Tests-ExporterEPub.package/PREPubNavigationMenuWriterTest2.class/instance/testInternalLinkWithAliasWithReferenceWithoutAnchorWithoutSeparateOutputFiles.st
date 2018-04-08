tests
testInternalLinkWithAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self assert: (self write: item) isEmpty