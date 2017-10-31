tests
testShouldRemoveWhenAnnotationAloneWithLineBreakInParagraph
	| document result misc annotation |
	annotation := self exampleAnnotation.
	misc := PRLineBreak new.
	document := PRDocument
		with:
			(PRParagraph
				withAll:
					{annotation.
					misc}).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = annotation.
	result := self executePhase: document.
	self deny: (document children first isKindOf: PRParagraph).
	self assert: document children first = annotation.
	self assert: document children size equals: 1