tests
testFigureReference
	| item resultString indexOfReference referenceString |
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
	indexOfReference := resultString indexOfSubCollection: 'See figure ' startingAt: 1 ifAbsent: [ self fail: 'The string ''See figure '' should have been found' ].
	referenceString := resultString allButFirst: indexOfReference - 1.
	self assert: referenceString includesSubstring: self referenceToFigurePierLogo