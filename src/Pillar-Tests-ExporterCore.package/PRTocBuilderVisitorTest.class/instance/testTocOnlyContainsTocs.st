tests
testTocOnlyContainsTocs
	| document expectedToc |
	document := PRPillarParser
		parse:
			'!! Test1
!!! Test2
!!! Test3
!! Test4
!!!! Test5
! Test6
!! Test7'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 2;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 3);
				addChildren:
					(PRToc new
						name: 'Test3';
						level: 3));
		addChildren:
			(PRToc new
				name: 'Test4';
				level: 2;
				addChildren:
					(PRToc new
						name: 'Test5';
						level: 4));
		addChildren:
			(PRToc new
				name: 'Test6';
				level: 1;
				addChildren:
					(PRToc new
						name: 'Test7';
						level: 2)).
	builder visit: document.
	self assert: builder toc equals: expectedToc