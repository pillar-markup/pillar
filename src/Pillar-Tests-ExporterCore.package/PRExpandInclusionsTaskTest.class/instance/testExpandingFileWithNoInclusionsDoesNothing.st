tests
testExpandingFileWithNoInclusionsDoesNothing

	| task document |
	document := PRDocument new.
	
	task := PRExpandInclusionsTask new.
	task inputFile: 'test' asFileReference.
	task pillarDocumentDependency: (PRGenericObjectTask result: document).
	
	self shouldnt: [task execute] raise: Error