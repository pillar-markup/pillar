tests
testTransformWithoutSection
	| input |
	input := PRDocument new
		add: (PRParagraph with: (PRText content: 'Foo!') yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: input