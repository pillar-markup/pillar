tests
testDocumentWithInputAnnotationAndTitle
	| document expectedToc |
	document := PRPillarParser
		parse:
			'
! Test1
!! Test2

${inputFile:input1.pillar}$

!! Test3'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 1;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 2;
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
						level: 2)).
	builder visit: document.
	self assert: builder toc children size equals: 1.
	self assert: builder toc equals: expectedToc