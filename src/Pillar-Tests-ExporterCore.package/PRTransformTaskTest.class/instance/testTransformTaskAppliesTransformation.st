tests
testTransformTaskAppliesTransformation

	| task transformationExecuted |
	transformationExecuted := false.
	task := PRTransformTask new.
	task pillarDocumentDependency: (PRGenericObjectTask result: PRDocument new).
	
	task addTransformation: (PRGenericTransformation doing: [ :document | transformationExecuted := true ]).
	
	task execute.
	
	self assert: transformationExecuted