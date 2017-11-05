tests-internalLinks
testInternalLinkWithAliasWithRefWithAncorWithSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar@foo')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithAnchorWithSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')