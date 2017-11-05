tests
testTransformWithOneAnnotation
	| input expected |
	input := PRDocument new
		add:
				PRSlideTitleAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRSlide new
				add: (PRParagraph with: (PRText content: 'Foo!') yourself);
				yourself) yourself.
	self assert: (self executePhase: input) equals: expected