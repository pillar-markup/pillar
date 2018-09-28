metadata
metadataConfigurationForDocument: aDocument 
	"create an environment with the local document properties as children of the document properties."
	
	| subConfiguration |
	subConfiguration := project configuration class newFromDictionary: aDocument properties.
	subConfiguration parent: project configuration.
	^ subConfiguration