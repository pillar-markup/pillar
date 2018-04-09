tests
testInternalLinkWithAliasWithReferenceWithoutAnchorWithSeparateOutputFiles
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self assert: (self writeWithSeparateOutputFiles: item) isEmpty