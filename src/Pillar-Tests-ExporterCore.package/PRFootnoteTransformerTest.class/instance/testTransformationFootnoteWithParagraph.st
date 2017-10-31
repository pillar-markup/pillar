tests
testTransformationFootnoteWithParagraph
	| input expected |
	input := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: 'Timo');
				add:
					(PRFootnoteAnnotation new
						parameterAt: 'note' put: 'Foo';
						yourself);
				add: (PRText content: 'Leon');
				yourself);
		yourself.
	expected := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: 'Timo');
				add: (PRFootnote noted: 'Foo');
				add: (PRText content: 'Leon');
				yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected