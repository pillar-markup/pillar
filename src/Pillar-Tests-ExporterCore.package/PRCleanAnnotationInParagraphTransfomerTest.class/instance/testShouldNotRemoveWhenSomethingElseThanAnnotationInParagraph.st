tests
testShouldNotRemoveWhenSomethingElseThanAnnotationInParagraph
	| document result misc |
	misc := self exampleMisc.
	document := PRDocument with: (PRParagraph with: misc).
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = misc.
	result := self executePhase: document.
	self assert: (document children first isKindOf: PRParagraph).
	self deny: document children first = misc