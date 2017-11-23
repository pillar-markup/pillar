I am a task that applies a template to an already formatted document (that is e.g., in LaTeX or html).

For more information about Pillar tasks, read the comment on PRPillarTask.

My dependencies are:

 - formattedDocumentDependency: the formatted document to apply the template on

Example of usage:

	task := PRTemplatingTask new.
	task formattedDocumentDependency: (PRGenericObjectTask
		result: (PROutputDocument new
			pillarDocument: (PRDocument new add: (PRParagraph new add: (PRText new text: 'yeah')));
			outputText: 'yeah')).
	task projectConfiguration: PRPillarConfiguration new.
	task templateFile: template.
	result := task execute.