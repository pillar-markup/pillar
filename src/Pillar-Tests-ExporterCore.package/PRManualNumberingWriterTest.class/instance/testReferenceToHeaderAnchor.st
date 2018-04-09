tests
testReferenceToHeaderAnchor
	| item resultString indexOfReference referenceString |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add: (PRAnchor named: 'chap:foo');
		add:
				(PRParagraph new
						add: (PRText content: 'See Chapter ');
						add:
								((PRInternalLink reference: 'chap:foo')
										counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
										yourself);
						yourself);
		yourself.
	[resultString := self write: item] on: PRLinkWarning do: [:w | w resume ].
	indexOfReference := resultString
		indexOfSubCollection: 'See Chapter '
		startingAt: 1
		ifAbsent: [ self fail: 'The string ''See Chapter '' should have been found' ].
	referenceString := resultString allButFirst: indexOfReference - 1.
	self assert: referenceString includesSubstring: self counter1ReferenceString