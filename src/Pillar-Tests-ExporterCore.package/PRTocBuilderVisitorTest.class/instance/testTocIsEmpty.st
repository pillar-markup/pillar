tests
testTocIsEmpty
	| document expectedToc |
	document := PRPillarParser parse: 'Test1'.
	builder visit: document.
	expectedToc := PRToc new level: 0.
	self assert: builder tableOfContents equals: expectedToc