metadata
metadataConfigurationForDocument: aPRDocument 
	
	| subConfiguration |
	subConfiguration := self configuration class new.
	subConfiguration parent: self configuration metadata.
	CCMagritteDictionaryReader
		writeDictionary: aPRDocument properties copy
		toConfiguration: subConfiguration.
	^ subConfiguration