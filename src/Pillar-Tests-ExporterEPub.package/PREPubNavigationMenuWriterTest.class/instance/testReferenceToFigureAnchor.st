tests
testReferenceToFigureAnchor
	| item resultString |
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
	resultString := self write: item.
	self assert: resultString includesSubstring: self level1HeaderWithFoo