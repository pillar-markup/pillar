tests-internalLinks
testInternalLinkWithoutAliasWithoutReferenceWithAnchorWithSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: '@foo')
						yourself);
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutAliasWithoutRefWithAnchorWithSeparateOutputFiles) ]