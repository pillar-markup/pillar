metadata
metadataConfigurationForDocument: aPRCompilationContext 
	
	| subConfiguration |
	subConfiguration := projectConfiguration class new.
	subConfiguration parent: projectConfiguration.
	CCMagritteDictionaryReader
		writeDictionary: self formattedDocument properties copy
		toConfiguration: subConfiguration.
	^ subConfiguration