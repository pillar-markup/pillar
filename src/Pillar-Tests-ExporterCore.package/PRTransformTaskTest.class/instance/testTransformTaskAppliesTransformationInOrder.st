tests
testTransformTaskAppliesTransformationInOrder

	| task result |
	
	result := OrderedCollection new.
	task := PRTransformTask new.
	task pillarDocumentDependency: (PRGenericObjectTask result: PRDocument new).
	
	task addTransformation: (PRMockTransformation doing: [ :document | result add: 1 ]).
	task addTransformation: (PRMockTransformation doing: [ :document | result add: 2 ]).
	
	task execute.
	
	self assert: result asArray equals: #(1 2)