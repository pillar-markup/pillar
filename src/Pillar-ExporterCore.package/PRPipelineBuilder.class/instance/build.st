building
build

	| pipeline |
	pipeline := PRParseTask new
		inputStreamDependency: (PRGenericObjectTask result: inputDocument file readStream binary).

	pipeline := PRExpandInclusionsTask new
		inputFile: inputDocument file;
		pillarDocumentDependency: pipeline.
	
	pipeline := PRTransformTask new
		transformations: self pillarDocumentTransformations;
		pillarDocumentDependency: pipeline.
		
	pipeline := PROutputFormatterTask new
		pillarDocumentDependency: pipeline;
		writer: outputFormatter.
	
	pipeline := self postFormattingTransformations
		inject: pipeline
		into: [ :accum :task | 
			task
				formattedDocumentDependency: accum;
				yourself ].
	
	save ifTrue: [ 
		pipeline := PRSaveTask new
			outputDocumentDependency: pipeline;
			outputFile: outputFile ].

	^ self postSaveTransformations
		inject: pipeline
		into: [ :accum :task | 
			task inputFileDependency: accum ]