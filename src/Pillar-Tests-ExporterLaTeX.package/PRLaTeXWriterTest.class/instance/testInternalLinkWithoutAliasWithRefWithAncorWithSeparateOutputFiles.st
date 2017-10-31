tests-internalLinks
testInternalLinkWithoutAliasWithRefWithAncorWithSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add: (PRInternalLink reference: 'ref@foo');
		yourself.
	self should: [ resultString := self writeWithSeparateOutputFiles: item ] raise: PRLinkWarning.
	[ resultString := self writeWithSeparateOutputFiles: item ]
		on: PRLinkWarning
		do: [ :w | w resume ].
	self resultWithRefWithAnchorWithSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithAnchorWithSeparateOutputFiles) ]