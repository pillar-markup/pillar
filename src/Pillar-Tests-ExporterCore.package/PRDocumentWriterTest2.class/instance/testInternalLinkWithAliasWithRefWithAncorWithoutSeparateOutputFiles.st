tests-internalLinks
testInternalLinkWithAliasWithRefWithAncorWithoutSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithRefWithAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithAnchorWithoutSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')