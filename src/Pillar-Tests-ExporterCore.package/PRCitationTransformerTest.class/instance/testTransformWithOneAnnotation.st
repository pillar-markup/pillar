tests
testTransformWithOneAnnotation
	| input expected |
	input := PRDocument new
		add: PRCitationAnnotation new;
		yourself.
	expected := PRDocument new add: PRCitation new.
	self assert: (self executePhase: input with: self configuration) equals: expected