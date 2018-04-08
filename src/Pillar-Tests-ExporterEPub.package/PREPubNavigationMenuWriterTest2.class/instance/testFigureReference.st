tests
testFigureReference
	| item resultString |
	item := PRParagraph new
		add:
				(PRFigure new
						reference: 'file://picture.png';
						parameterAt: 'label' put: 'pierLogo';
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 2 );
						yourself);
		add: (PRText content: 'See figure ');
		add: ((PRInternalLink reference: '@pierLogo') counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 2 ));
		yourself.
		resultString := self write: item.
	self assert: (self write: item) isEmpty