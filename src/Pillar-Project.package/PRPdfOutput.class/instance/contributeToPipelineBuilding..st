building
contributeToPipelineBuilding: aPRPipelineBuilder 
		
	| project configuration goal templateFile |
	goal := aPRPipelineBuilder goal.
	project := goal project.
	configuration := project configuration.
	templateFile := project baseDirectory / 
		((goal target writerFor: configuration) templateForConfiguration: configuration).

	aPRPipelineBuilder outputFormatter: self.
	aPRPipelineBuilder
		addPostFormattingTransformation: (PRTemplatingTask new
			projectConfiguration: configuration;
			templateFile: templateFile;
			yourself).
	aPRPipelineBuilder addPillarDocumentTransformation: (PRRelativeReferenceTransformer new
		inputFile: goal inputDocument file;
		baseDirectory: project baseDirectory absolutePath asFileReference;
		outputDirectory: goal targetOutputDirectory).
	aPRPipelineBuilder addPostSaveTransformation: (PRPDFLatexCompilationTask new
		outputDirectory: goal targetOutputDirectory;
		outputFile: goal outputDirectory / goal inputDocument file basename , 'pdf';
		yourself).