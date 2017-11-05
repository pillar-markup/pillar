tests
testShouldNotBreakWithEmptyParagraph
	| document |
	document := PRDocument with: PREmptyParagraph new.
	self executePhase: document