tests
testTransformationWithContentInsideColumnsBeforeColumn
	| input expected |
	input := PRDocument new
		add:
				PRColumnsAnnotation new;
		add: (PRParagraph with: (PRText content: 'Foo') yourself);
		add:
				(PRColumnAnnotation withParameters: (
					PRParameters withAll: { 
						PRParameter 
							keyNode: (PRParameterKey named: 'width')
							valueNode: (PRParameterValue value: '100') }));
		add: (PRParagraph with: (PRText content: 'Bar') yourself);
		add:
				PREndColumnsAnnotation new;
		yourself.
	expected := PRDocument new
		add:
				(PRColumns new
						add: (PRParagraph with: (PRText content: 'Foo') yourself);
						add: ((PRColumn width: '100') add: (PRParagraph with: (PRText content: 'Bar') yourself) yourself);
						yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected