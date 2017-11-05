accessing
allTransformers
	| configuration |
	configuration := PRPillarConfiguration new
		disabledPhases: {};
		yourself.
	^ PRTransformPipeline allPipeClasses: configuration