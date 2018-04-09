tests
testInternalLinkWithAliasWithoutReferenceWithAnchorWithSeparateOutputFiles
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self assert: (self writeWithSeparateOutputFiles: item) isEmpty