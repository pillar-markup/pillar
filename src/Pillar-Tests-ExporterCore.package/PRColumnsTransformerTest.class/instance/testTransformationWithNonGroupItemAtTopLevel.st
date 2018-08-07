tests
testTransformationWithNonGroupItemAtTopLevel
	| input expected |
	"This test makes sure that a document item which is not a document group can be a direct child of a column"
	input := PRDocument new
		add: PRColumnsAnnotation new;
		add:
			(PRColumnAnnotation
				withParameters: (
					PRParameters withAll: { 
						PRParameter 
							keyNode: (PRParameterKey named: 'width')
							valueNode: (PRParameterValue value: '100') }));
		add: PRHorizontalRule new;
		add: PREndColumnsAnnotation new;
		yourself.
	expected := PRDocument new
		add:
			(PRColumns new
				add:
					((PRColumn width: '100')
						add: PRHorizontalRule new;
						yourself));
		yourself.
	self assert: (self executePhase: input) equals: expected