building
pipelineForOutput: anOutput doing: aBlock

	| builder |
	builder := PRPipelineBuilder new.
	self contributeToPipelineBuilding: builder.
	project contributeToPipelineBuilding: builder.
	anOutput contributeToPipelineBuilding: builder.
	aBlock value: builder.
	^ builder build