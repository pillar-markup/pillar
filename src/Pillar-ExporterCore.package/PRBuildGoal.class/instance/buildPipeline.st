building
buildPipeline
	
	| builder |	
	builder := PRPipelineBuilder new.
	builder goal: self.	
	project contributeToPipelineBuilding: builder.
	input   contributeToPipelineBuilding: builder.
	target  contributeToPipelineBuilding: builder.

	builder save.
	^ builder build