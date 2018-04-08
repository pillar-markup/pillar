tests-internalLinks
testInternalLinkWithoutAliasWithRefWithAncorWithSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar@foo');
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithAnchorWithSeparateOutputFiles) ]