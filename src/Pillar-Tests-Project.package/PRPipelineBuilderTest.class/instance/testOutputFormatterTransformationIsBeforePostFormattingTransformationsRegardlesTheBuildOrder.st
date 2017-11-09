order
testOutputFormatterTransformationIsBeforePostFormattingTransformationsRegardlesTheBuildOrder
	| builder pipeline phase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	"Set the post formatting transformation before the output formatting"
	builder addPostFormattingTransformation: phase.
	builder outputFormatter: PRLaTeXWriter new.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 2.
	self assert: (pipeline pipes before: phase) isOutputFormatterPhase