tests-internalLinks
testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref.pillar')
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ].