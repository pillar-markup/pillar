tests
testTransformationBeginningColumnsWithoutEnding
	| input |
	input := PRDocument
		withAll:
			{PRColumnsAnnotation new.
			(PRColumnAnnotation
				withParameters: (
					PRParameters withAll: { 
						PRParameter 
							keyNode: (PRParameterKey named: 'width')
							valueNode: (PRParameterValue value: 100) })).
			(PRText content: 'Foo')}.
	self should: [ self executePhase: input ] raise: PRError whoseDescriptionIncludes: 'Missing end' description: 'Code must detect the absence of end annotation'