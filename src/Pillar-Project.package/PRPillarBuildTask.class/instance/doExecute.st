execution
doExecute
	
	| pipeline compilationContext fileConfiguration |
	pipeline := inputDocument pipelineForOutput: buildTarget doing: [ :builder | builder save ].
	fileConfiguration := (PRPillarConfiguration newFromDictionary: {
		'input' -> inputDocument.
		'_outputFormat' -> buildTarget.
		'_project' -> project.
	} asDictionary)
		parent: project configuration.
	compilationContext := PRCompilationContext
		withDocument: inputDocument file
		withConfiguration: fileConfiguration.
	pipeline executeOn: compilationContext