I am a task that applies several transformations to a pillar AST document. I keep an ordered collection of transformations that will be applied in order.

For more information about Pillar tasks, read the comment on PRPillarTask.

My dependencies are:

 - pillarDocumentDependency: the pillar AST document to transform

Example of usage:

	task := PRTransformTask new.
	task pillarDocumentDependency: (PRGenericObjectTask result: PRDocument new).
	
	task addTransformation: (PRGenericTransformation doing: [ :document | "some transformation" ]).
	task addTransformation: (PRGenericTransformation doing: [ :document | "other transformation" ]).
	
	task execute.
