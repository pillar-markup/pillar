tests
testDocumentWithOnlyInputAnnotation
	| document expectedToc |
	document := PRPillarParser parse: '${inputFile:path=input2.pillar}$'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'TestFile21';
				level: 2;
				fileReference: 'input2.pillar').
	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar');
		visit: document.
	self assert: builder tableOfContents equals: expectedToc