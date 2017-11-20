execution
doExecute
	
	| inclusionPhase hackedConfiguration |
	inclusionPhase := PRFileInclusion new.
	"FileInclusion requires a configuration with an input entry"
	hackedConfiguration := PRPillarConfiguration newFromDictionary: { #input -> goal inputDocument } asDictionary.
	hackedConfiguration parent: goal project configuration.
	inclusionPhase configuration: hackedConfiguration.
	^ self cacheResult: (inclusionPhase executeOn: pillarDocument execute)