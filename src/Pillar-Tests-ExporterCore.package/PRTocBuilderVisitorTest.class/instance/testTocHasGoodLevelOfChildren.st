tests
testTocHasGoodLevelOfChildren
	| document expectedToc |
	document := PRPillarParser
		parse:
			'!! Test1
!!! Test2
!! Test3
! Test4'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 2;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 3));
		addChildren:
			(PRToc new
				name: 'Test3';
				level: 2);
		addChildren:
			(PRToc new
				name: 'Test4';
				level: 1).
	builder visit: document.
	self assert: builder toc equals: expectedToc