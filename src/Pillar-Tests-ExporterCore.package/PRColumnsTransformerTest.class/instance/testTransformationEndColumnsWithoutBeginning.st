tests
testTransformationEndColumnsWithoutBeginning
	| input |
	input := PRDocument with: PREndColumnsAnnotation new.
	self should: [ (self executePhase: input with: self configuration) ] raise: PRError whoseDescriptionIncludes: 'out of a column environment' description: 'Code should detect a missing annotation'