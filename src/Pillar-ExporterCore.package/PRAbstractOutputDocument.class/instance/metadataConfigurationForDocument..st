accessing
metadataConfigurationForDocument: aDocument 
	
	| subConfiguration |
	subConfiguration := project configuration class new.
	subConfiguration parent: project configuration.
	CCMagritteDictionaryReader
		writeDictionary: aDocument properties copy
		toConfiguration: subConfiguration.
	^ subConfiguration