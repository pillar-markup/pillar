I am a task that writes a pillar AST document into some output format such as LaTeX or html.

For more information about Pillar tasks, read the comment on PRPillarTask.

My dependencies are:

 - pillarDocumentDependency: the pillar AST document to write

Example of usage:

	task := PROutputFormatterTask new.
	task pillarDocumentDependency: (PRGenericObjectTask result: PRDocument new).
	task writer: aWriter.
	
	result := task execute.