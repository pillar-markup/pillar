tests
testTransformationBeginningColumnsWithoutEnding
	| input |
	input := PRDocument
		withAll:
			{PRColumnsAnnotation new.
			(PRColumnAnnotation
				withParameters:
					(OrderedDictionary new
						at: 'width' put: '100';
						yourself)).
			(PRText content: 'Foo')}.
	self should: [ self executePhase: input ] raise: PRError whoseDescriptionIncludes: 'Missing end' description: 'Code must detect the absence of end annotation'