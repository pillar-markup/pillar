templating
metadataConfigurationForDocument: aPRCompilationContext 
	
	| subConfiguration |
	subConfiguration := project configuration class new.
	subConfiguration parent: project configuration.
	CCMagritteDictionaryReader
		writeDictionary: pillarDocument execute properties copy
		toConfiguration: subConfiguration.
	^ subConfiguration