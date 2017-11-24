tests
testTransformTaskAppliesTransformationInOrder

	| task result |
	
	result := OrderedCollection new.
	task := PRTransformTask new.
	task pillarDocumentDependency: (PRGenericObjectTask result: PRDocument new).
	
	task addTransformation: (PRGenericTransformation doing: [ :document | result add: 1 ]).
	task addTransformation: (PRGenericTransformation doing: [ :document | result add: 2 ]).
	
	task execute.
	
	self assert: result asArray equals: #(1 2)