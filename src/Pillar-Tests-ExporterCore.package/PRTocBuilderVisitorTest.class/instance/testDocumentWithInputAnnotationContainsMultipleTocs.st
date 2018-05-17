tests
testDocumentWithInputAnnotationContainsMultipleTocs
	| expectedToc |
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'test1';
				level: 1);
		addChildren:
			(PRToc new
				name: 'test2';
				level: 1);
		addChildren:
			(PRToc new
				name: 'test3';
				level: 1;
				addChildren:
					(PRToc new
						name: 'TestFile21';
						level: 2;
						fileRef: 'input2.pillar'));
		addChildren:
			(PRToc new
				name: 'test4';
				level: 1;
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
						fileRef: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile31';
						level: 2;
						fileRef: 'input3.pillar';
						addChildren:
							(PRToc new
								name: 'TestFile15';
								level: 3;
								fileRef: 'input1.pillar'))).
	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar');
		visit: advancedDocument.
	self assert: builder toc equals: expectedToc