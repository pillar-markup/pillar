tests
testExpandingFileWithNoInclusionsDoesNothing

	| task document |
	document := PRDocument new.
	
	task := PRExpandInclusionsTask new.
	task goal: (PRBuildGoal new
		inputDocument: (PRInputDocument new file: 'test'; yourself)).
	task pillarDocumentDependency: (PRGenericObjectTask result: document).
	
	self shouldnt: [task execute] raise: Error