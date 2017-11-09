building
buildFile: inputDocument withOutput: output
	| pipeline compilationContext fileConfiguration |
	pipeline := inputDocument pipelineForOutput: output doing: [ :builder | builder save ].
	fileConfiguration := (PRPillarConfiguration newFromDictionary: {
		'input' -> inputDocument.
		'_outputFormat' -> output.
		'_project' -> self.
	} asDictionary)
		parent: self configuration.
	compilationContext := PRCompilationContext
		withDocument: inputDocument file
		withConfiguration: fileConfiguration.
	pipeline executeOn: compilationContext