tests
testTransformAnnotationStopAtTitle
	| input expected |
	input := PRDocument new
		add:
				PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Foo');
						yourself);
		yourself.
	expected := PRDocument new
		add:
				(PRSlide new
						add: (PRParagraph with: (PRText content: 'Foo!') yourself);
						yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'Foo');
						yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected