tests
testTransformWithTwoAnnotation
	| input expected |
	input := PRDocument new
		add:
				PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		add:
				PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Bar') yourself);
		yourself.
	expected := PRDocument new
		add:
				(PRSlide new
						add: (PRParagraph with: (PRText content: 'Foo!') yourself);
						yourself);
		add:
				(PRSlide new
						add: (PRParagraph with: (PRText content: 'Bar') yourself);
						yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected