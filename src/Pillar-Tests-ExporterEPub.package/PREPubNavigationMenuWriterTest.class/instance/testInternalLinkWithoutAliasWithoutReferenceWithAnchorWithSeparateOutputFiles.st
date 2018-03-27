tests
testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithSeparateOutputFiles
	| item |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						yourself);
		yourself.
	self assert: (self writeWithSeparateOutputFiles: item) isEmpty