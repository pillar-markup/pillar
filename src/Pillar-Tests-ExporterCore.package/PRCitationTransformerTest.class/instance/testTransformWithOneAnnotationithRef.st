tests
testTransformWithOneAnnotationithRef
	| input expected |
	input := PRDocument new
		add:
			(PRCitationAnnotation new
				parameterAt: 'ref' put: 'foo';
				yourself).
	expected := PRDocument new add: (PRCitation ref: 'foo').
	self assert: (self executePhase: input with: self configuration) equals: expected