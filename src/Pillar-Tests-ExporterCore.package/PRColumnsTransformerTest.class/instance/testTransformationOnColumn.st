tests
testTransformationOnColumn
	| input expected |
	input := PRDocument new
		add:
				PRColumnsAnnotation new;
		add:
				(PRColumnAnnotation withParameters: (
					PRParameters withAll: { 
						PRParameter 
							keyNode: (PRParameterKey named: 'width')
							valueNode: (PRParameterValue value: '100') }));
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