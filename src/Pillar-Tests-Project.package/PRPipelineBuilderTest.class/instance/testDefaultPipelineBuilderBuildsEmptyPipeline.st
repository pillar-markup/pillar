tests
testDefaultPipelineBuilderBuildsEmptyPipeline
	| builder |
	builder := PRPipelineBuilder new.
	self assert: builder build pipes isEmpty