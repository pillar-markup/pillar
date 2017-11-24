I am a task that expands a pillar AST document's includes. I visit the document structure and replace each file inclusion with the AST document of the included file. Moreover, I replace all links (pictures and other includes) inside the included document so they are relative to the including document instead of being relative to the included document.

I am in essence recursive. If I include a file that contains inclusions, I'll apply such inclusions also.

In case of a cyclic inclution (e.g., A includes B and B includes A) I raise a PRCyclicDileInclusionError with the files causing the problem.

For more information about Pillar tasks, read the comment on PRPillarTask.

My dependencies are:

 - pillarDocumentDependency: the pillar AST document where inclusions were not processed yet.

Example of usage:

	task := PRExpandInclusionsTask new.
	task goal: (PRBuildGoal new
		inputDocument: (PRInputDocument new file: topFileReference; yourself)).
	task pillarDocumentDependency: (PRGenericObjectTask result: document).
	
	task execute