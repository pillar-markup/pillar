building
build

	| pipeline |
	pipeline := PRPillarParseTask new
		goal: goal.

	pipeline := PRExpandPillarFileTask new
		pillarDocument: pipeline;
		goal: goal.
	
	pipeline := PRTransformTask new
		transformations: (LPPipeline pipes: self pillarDocumentTransformations) sort pipes;
		pillarDocument: pipeline;
		goal: goal.
		
	pipeline := PROutputFormatterTask new
		pillarDocument: pipeline;
		goal: goal.
	
	pipeline := self postFormattingTransformations
		inject: pipeline
		into: [ :accum :task | 
			task
				goal: goal;
				pillarDocument: accum;
				yourself ].
	
	save ifTrue: [ 
		pipeline := PRSaveTask new
			pillarDocument: pipeline;
			goal: goal ].

	^ self postSaveTransformations
		inject: pipeline
		into: [ :accum :task | 
			task 
				goal: goal;
				pillarDocument: accum ]