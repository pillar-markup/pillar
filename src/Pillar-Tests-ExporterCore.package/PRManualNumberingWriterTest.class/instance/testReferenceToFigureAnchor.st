tests
testReferenceToFigureAnchor
	| item resultString indexOfReference referenceString |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add:
				(PRParagraph new
						add:
								(PRFigure new
										reference: 'file://picture.png';
										parameterAt: 'label' put: 'fig:picture';
										counter:
												((PRCascadingCounter maxLevel: 5)
														incrementAt: 1;
														incrementAt: 2);
										yourself);
						add: (PRText content: 'See Figure ');
						add:
								((PRInternalLink reference: 'fig:picture')
										counter:
												((PRCascadingCounter maxLevel: 5)
														incrementAt: 1;
														incrementAt: 2);
										yourself);
						yourself).
	[resultString := self write: item] on: PRLinkWarning do: [:w | w resume ].
	indexOfReference := resultString
		indexOfSubCollection: 'See Figure '
		startingAt: 1
		ifAbsent: [ self fail: 'The string ''See Figure '' should have been found' ].
	referenceString := resultString allButFirst: indexOfReference - 1.
	self assert: referenceString includesSubstring: self counter11ReferenceString