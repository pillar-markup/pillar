tests-internalLinks
testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithoutSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						yourself);
		yourself.
	resultString := self write: item.
	self resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutAliasWithoutRefWithAnchorWithoutSeparateOutputFiles) ]