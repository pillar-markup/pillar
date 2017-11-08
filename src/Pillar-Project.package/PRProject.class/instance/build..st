building
build: output

	self prepareForTarget: output.
	self filesToBuild do: [ :each | | pipeline compilationContext fileConfiguration |
		pipeline := each pipelineForOutput: output doing: [ :builder | builder save ].
		fileConfiguration := (PRPillarConfiguration newFromDictionary: {
			'input' -> each.
			'_outputFormat' -> output.
			'outputType' -> output outputType.
			'_project' -> self.
		} asDictionary)
			parent: self configuration.
		compilationContext := PRCompilationContext
			withDocument: each file
			withConfiguration: fileConfiguration.
		pipeline executeOn: compilationContext ]