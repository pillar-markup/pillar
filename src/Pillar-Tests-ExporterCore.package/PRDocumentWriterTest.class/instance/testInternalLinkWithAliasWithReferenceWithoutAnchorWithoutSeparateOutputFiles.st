tests-internalLinks
testInternalLinkWithAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')