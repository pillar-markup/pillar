tests-internalLinks
testInternalLinkWithAliasWithoutReferenceWithAnchorWithoutSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithoutRefWithAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutRefWithAnchorWithoutSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')