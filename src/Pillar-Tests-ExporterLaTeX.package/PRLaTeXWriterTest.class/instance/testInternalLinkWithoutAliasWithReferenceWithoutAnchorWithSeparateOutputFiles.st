tests-internalLinks
testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref');
		yourself.
	self should: [ resultString := self writeWithSeparateOutputFiles: item ] raise: PRLinkWarning.
	[ resultString := self writeWithSeparateOutputFiles: item ]
		on: PRLinkWarning
		do: [ :w | w resume ].
	self resultWithRefWithoutAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithSeparateOutputFiles) ]