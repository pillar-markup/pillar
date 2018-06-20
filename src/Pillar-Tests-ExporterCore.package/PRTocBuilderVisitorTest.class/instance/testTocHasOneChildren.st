tests
testTocHasOneChildren
	| document expectedToc |
	document := PRPillarParser
		parse:
			'! Test1
!! Test2'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 1;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 2)).
	builder visit: document.
	self assert: builder tableOfContents equals: expectedToc