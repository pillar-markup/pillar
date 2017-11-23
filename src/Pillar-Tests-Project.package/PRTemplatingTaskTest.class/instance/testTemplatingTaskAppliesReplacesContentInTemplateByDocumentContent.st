tests
testTemplatingTaskAppliesReplacesContentInTemplateByDocumentContent

	| task result template |
	
	template := FileSystem memory root / 'template'.
	template writeStreamDo: [ :stream | stream nextPutAll: 'first{{content}}second' ].
	
	task := PRTemplatingTask new.
	task formattedDocumentDependency: (PRGenericObjectTask
		result: (PROutputDocument new
			pillarDocument: (PRDocument new add: (PRParagraph new add: (PRText new text: 'yeah')));
			outputText: 'yeah')).
	task projectConfiguration: PRPillarConfiguration new.
	task templateFile: template.
	result := task execute.
	
	self assert: result outputText equals: 'firstyeahsecond'