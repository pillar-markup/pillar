order
testDocumentTransformationIsBeforeOutputFormattingTransformationRegardlesTheBuildOrder
	| builder pipeline phase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	"Set the output formatter before the pillar document transformation"
	builder outputFormatter: PRLaTeXWriter new.
	builder addPillarDocumentTransformation: phase.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 2.
	self assert: (pipeline pipes after: phase) isOutputFormatterPhase