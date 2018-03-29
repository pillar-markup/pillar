tests
testTransformationOnColumn
	| input expected |
	input := PRDocument new
		add:
				PRColumnsAnnotation new;
		add:
				(PRColumnAnnotation withParameters: (SmallDictionary new
								at: 'width' put: '100';
								yourself) yourself);
		add:	(PRParagraph new
						add: (PRText content: 'Foo');
						yourself);
		add:
				PREndColumnsAnnotation new;
		yourself.
	expected := PRDocument new
		add:
				(PRColumns new
						add:
							((PRColumn width: '100')
								add:
										(PRParagraph new
												add: (PRText content: 'Foo');
												yourself);
								yourself));
		yourself.
	self assert: (self executePhase: input) equals: expected