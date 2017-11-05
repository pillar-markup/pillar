tests-internalLinks
testInternalLinkWithAliasWithoutReferenceWithAnchorWithSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithoutRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutRefWithAnchorWithSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')