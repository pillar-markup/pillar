tests
testPipelineChainsValueBetweenTransformations

	| builder pipeline |
	builder := PRPipelineBuilder new.
	builder addPreParsingTransformation: (PRGenericPhase doing: [ :previousValue | 
		PRCompilationContext withDocument: #( first ) withConfiguration: nil ]).
	builder addPillarDocumentTransformation: (PRGenericPhase doing: [ :previousValue | 
		PRCompilationContext withDocument: (previousValue input , #( second )) withConfiguration: nil ]).
	builder addPostFormattingTransformation: (PRGenericPhase doing: [ :previousValue | 
		PRCompilationContext withDocument: (previousValue input , #( third )) withConfiguration: nil ]).
	pipeline := builder build.
	
	self assert: (pipeline executeOn: PRCompilationContext new) input equals: #( first second third ).