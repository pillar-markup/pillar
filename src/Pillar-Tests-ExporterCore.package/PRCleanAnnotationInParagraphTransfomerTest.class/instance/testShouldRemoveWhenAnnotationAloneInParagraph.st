tests
testShouldRemoveWhenAnnotationAloneInParagraph
	| document result annotation |
	annotation := self exampleAnnotation.
	document := PRDocument with: (PRParagraph with: annotation).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = annotation.
	result := self executePhase: document.
	self deny: (document children first isKindOf: PRParagraph).
	self assert: document children first = annotation