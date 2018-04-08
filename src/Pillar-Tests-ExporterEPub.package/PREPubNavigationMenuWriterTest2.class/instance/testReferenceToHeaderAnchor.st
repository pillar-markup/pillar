tests
testReferenceToHeaderAnchor
	| item resultString |
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
	resultString := self write: item.
	self assert: resultString includesSubstring: self level1HeaderWithFoo