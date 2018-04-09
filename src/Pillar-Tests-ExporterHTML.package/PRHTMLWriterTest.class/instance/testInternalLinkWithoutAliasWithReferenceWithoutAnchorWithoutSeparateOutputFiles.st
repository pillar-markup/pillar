tests-internalLinks
testInternalLinkWithoutAliasWithReferenceWithoutAnchorWithoutSeparateOutputFiles
	| item resultString |
	item := PRParagraph new
		add: (PRAnchor named: 'foo');
		add:
				((PRInternalLink reference: 'ref')
						addAll: {(PRText content: 'Alias')};
						yourself);
		yourself.
	self should: [ resultString := self write: item ] raise: PRLinkWarning.
	[ resultString := self write: item ]
		on: PRLinkWarning
		do: [ :w | w resume ].
	self resultWithRefWithoutAnchorWithoutSeparateOutputFiles = ''
		ifFalse: [ self assert: (resultString includesSubstring: self resultWithRefWithoutAnchorWithoutSeparateOutputFiles) ]