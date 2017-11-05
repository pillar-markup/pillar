tests-internalLinks
testInternalLinkWithAliasWithReferenceWithoutAnchorWithSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithRefWithoutAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithSeparateOutputFiles) ].
	self assert: (resultString includesSubstring: 'Alias')