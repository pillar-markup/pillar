private-building
contributeToPipelineBuilding: aPRPipelineBuilder 
	
	self plugins do: [ :each | each contributeToPipelineBuilding: aPRPipelineBuilder ]