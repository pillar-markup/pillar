protected
buildFileInclusionPipeline: aConfiguration
	| pipes |
	pipes := OrderedCollection new.
	pipes add: (PRParsingPhase buildPipe: aConfiguration).
	pipes add: (PRCheckPipeline buildPipe: aConfiguration).
	self shouldTransform
		ifTrue: [ pipes add: (PRTransformPipeline buildPipe: aConfiguration) ].
	pipes add: (PRFileInclusion buildPipe: aConfiguration).
	^ (LPPipeline pipes: pipes) sort