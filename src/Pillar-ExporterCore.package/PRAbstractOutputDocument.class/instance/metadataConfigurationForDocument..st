accessing
metadataConfigurationForDocument: aDocument 
	
	| subConfiguration |
	subConfiguration := project configuration class newFromDictionary: aDocument properties.
	subConfiguration parent: project configuration.
	^ subConfiguration