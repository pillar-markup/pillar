tests
testTitlesHaveGoodFileRefs
	| document expectedToc |
	document := PRPillarParser
		parse:
			'!! Test1
!!! Test2
${inputFile:input1.pillar}$
!! Test3
! Test4'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 2;
				fileRef: nil;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 3;
						fileRef: nil);
				addChildren:
					(PRToc new
						name: 'TestFile11';
						level: 3;
						fileRef: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile12';
						level: 3;
						fileRef: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile13';
						level: 3;
						fileRef: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile14';
						level: 3;
						fileRef: 'input1.pillar'));
		addChildren:
			(PRToc new
				name: 'TestFile31';
				level: 2;
				fileRef: 'input3.pillar';
				addChildren:
					(PRToc new
						name: 'TestFile15';
						level: 3;
						fileRef: 'input1.pillar'));
		addChildren:
			(PRToc new
				name: 'Test3';
				level: 2;
				fileRef: nil);
		addChildren:
			(PRToc new
				name: 'Test4';
				level: 1;
				fileRef: nil).
	builder visit: document.
	self assert: builder toc equals: expectedToc