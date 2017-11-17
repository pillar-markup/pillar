execution
doExecute
	
	| phase |
	phase := PROutputFormattingPhase withFormatter: outputFormat.
	phase configuration: project configuration.
	^ self cacheResult: (phase executeOn: pillarDocument execute)