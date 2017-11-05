tests
testTransformationWithColumnsInColumns
	| input |
	input := PRDocument new
		add:
				PRColumnsAnnotation new;
		add:
				PRColumnsAnnotation new;
		add:
				PREndColumnsAnnotation new;
		add:
				PREndColumnsAnnotation new;
		yourself.
	self should: [ self executePhase: input ] raise: PRError whoseDescriptionIncludes: 'close a columns environment' description: 'Code is missing a check'