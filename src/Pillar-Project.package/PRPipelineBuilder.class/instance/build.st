building
build
	| transformations |
	transformations := OrderedCollection new.
	transformations addAll: self preParsingTransformations.
	parser ifNotNil: [
		transformations
			add: (PRParsingPhase withParser: parser);
			add: (PRFileInclusion new) ].
	transformations addAll: (LPPipeline pipes: self pillarDocumentTransformations) sort pipes.
	outputFormatter
		ifNotNil: [ transformations add: (PROutputFormattingPhase withFormatter: outputFormatter) ].
	transformations addAll: self postFormattingTransformations.
	save ifTrue: [ 
		transformations add: PRSavePhase new ].
	transformations addAll: self postSaveTransformations.
	^ LPPipeline pipes: transformations