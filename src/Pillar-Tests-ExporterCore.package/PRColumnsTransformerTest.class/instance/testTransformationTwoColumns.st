tests
testTransformationTwoColumns
	| input expected |
	input := PRDocument new
		add: PRColumnsAnnotation new;
		add:
			(PRColumnAnnotation
				withParameters:
					(SmallDictionary new
						at: 'width' put: '50';
						yourself) yourself);
		add:
			(PRParagraph new
				add: (PRText content: 'Foo');
				yourself);
		add:
			(PRColumnAnnotation
				withParameters:
					(SmallDictionary new
						at: 'width' put: '50';
						yourself) yourself);
		add:
			(PRParagraph new
				add: (PRText content: 'Bar');
				yourself);
		add: PREndColumnsAnnotation new;
		yourself.
	expected := PRDocument new
		add:
			(PRColumns new
				add:
					((PRColumn width: '50')
						add:
							(PRParagraph new
								add: (PRText content: 'Foo');
								yourself));
				add:
					((PRColumn width: '50')
						add:
							(PRParagraph new
								add: (PRText content: 'Bar');
								yourself);
						yourself));
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected