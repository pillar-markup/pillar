building
contributeToPipelineBuilding: aPRPipelineBuilder
	
	| project configuration goal templateFile |
	goal := aPRPipelineBuilder goal.
	project := goal project.
	configuration := project configuration.
	templateFile := project baseDirectory / 
		((goal target writerFor: configuration) templateForConfiguration: configuration).

	aPRPipelineBuilder outputFormatter: PRHTMLWriter new.
	aPRPipelineBuilder
		addPostFormattingTransformation: (PRTemplatingTask new
			projectConfiguration: project configuration;
			templateFile: templateFile)