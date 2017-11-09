building
contributeToPipelineBuilding: aPRPipelineBuilder 
	
	aPRPipelineBuilder outputFormatter: PRHTMLWriter new.
	aPRPipelineBuilder addPostFormattingTransformation: PRTemplatingPhase new.