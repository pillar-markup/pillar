tests
testDocumentWithoutInputAnnotationOnlyContainsTitles
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
				level: 1).
	builder visit: simpleDocument.
	self assert: builder tableOfContents equals: expectedToc