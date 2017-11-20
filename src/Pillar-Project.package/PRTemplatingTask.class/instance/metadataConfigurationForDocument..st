metadata
metadataConfigurationForDocument: aPRCompilationContext 
	
	| subConfiguration |
	subConfiguration := goal project configuration class new.
	subConfiguration parent: goal project configuration.
	CCMagritteDictionaryReader
		writeDictionary: pillarDocument execute properties copy
		toConfiguration: subConfiguration.
	^ subConfiguration