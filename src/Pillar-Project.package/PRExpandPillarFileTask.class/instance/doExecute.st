execution
doExecute
	
	| inclusionPhase |
	inclusionPhase := PRFileInclusion new.
	inclusionPhase configuration: nil.
	^ self cacheResult: (inclusionPhase executeOn: pillarDocument execute)