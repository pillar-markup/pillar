tests
testTransformWithAnnotationAndText
	| input expected |
	input := PRDocument new
		add:
			(PRParagraph new
				add: (PRText new text: 'hello');
				add: PRCitationAnnotation new;
				add: (PRText new text: 'hello');
				yourself).
	expected := PRDocument new
		add:
			(PRParagraph new
				add: (PRText new text: 'hello');
				add: (PRCitation new);
				add: (PRText new text: 'hello');
				yourself).
	self assert: (self executePhase: input with: self configuration) equals: expected