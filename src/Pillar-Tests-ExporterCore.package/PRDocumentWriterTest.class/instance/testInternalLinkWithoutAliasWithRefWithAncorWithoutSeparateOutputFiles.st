tests-internalLinks
testInternalLinkWithoutAliasWithRefWithAncorWithoutSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar@foo');
		yourself.
	resultString := self write: item.
	self resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithoutAliasWithRefWithAnchorWithoutSeparateOutputFiles) ]