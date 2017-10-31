tests-internalLinks
testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref.pillar');
		yourself.
	resultString := self writeWithSeparateOutputFiles: item.
	self resultWithRefWithoutAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithSeparateOutputFiles) ]