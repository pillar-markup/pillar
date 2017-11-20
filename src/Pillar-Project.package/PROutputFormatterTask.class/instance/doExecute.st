execution
doExecute
	
	| phase |
	phase := PROutputFormattingPhase withFormatter: goal target.
	phase configuration: goal project configuration.
	^ self cacheResult: (phase executeOn: pillarDocument execute)