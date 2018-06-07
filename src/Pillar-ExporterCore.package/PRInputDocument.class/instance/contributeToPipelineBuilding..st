building
contributeToPipelineBuilding: aPRPipelineBuilder 
	
	1halt.
	self flag: #maybeToRemove.
	
	aPRPipelineBuilder setInputDocument: file.
	aPRPipelineBuilder parser: self parser