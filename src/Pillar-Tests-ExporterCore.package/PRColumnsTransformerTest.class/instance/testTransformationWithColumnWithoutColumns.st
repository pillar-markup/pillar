tests
testTransformationWithColumnWithoutColumns
	| input |
	input := PRDocument new
		add: PRColumnAnnotation new;
		add:
			(PRParagraph new
				add: (PRText content: 'Foo');
				yourself);
		add: PREndColumnsAnnotation new;
		yourself.
	self
		should: [ self executePhase: input ]
		raise: PRError
		whoseDescriptionIncludes: 'not inside a column environment'
		description: 'Code is missing a check'