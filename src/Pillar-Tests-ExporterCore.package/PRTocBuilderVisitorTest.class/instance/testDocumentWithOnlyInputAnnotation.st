tests
testDocumentWithOnlyInputAnnotation
	| document expectedToc |
	document := PRPillarParser parse: '${inputFile:input2.pillar}$'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'TestFile21';
				level: 2;
				fileRef: 'input2.pillar').
	builder documentSource: (FileSystem workingDirectory / 'document.pillar'); visit: document.
	self assert: builder toc equals: expectedToc