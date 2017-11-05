tests
testShouldNotRemoveWhenSomethingElseFollowsTheAnnotationInParagraph
	| document result misc annotation |
	annotation := self exampleAnnotation.
	misc := self exampleMisc.
	document := PRDocument
		with:
			(PRParagraph
				withAll:
					{annotation.
					misc}).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = annotation.
	result := self executePhase: document.
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = annotation