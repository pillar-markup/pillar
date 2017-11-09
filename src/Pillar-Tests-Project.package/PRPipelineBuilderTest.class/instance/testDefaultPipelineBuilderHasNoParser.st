tests
testDefaultPipelineBuilderHasNoParser
	| builder |
	builder := PRPipelineBuilder new.
	self assert: builder parser isNil