execution
doExecute
	| templateValues templatedOutput document |
		
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	templateValues := (self metadataConfigurationForDocument: pillarDocument execute) allProperties.
	templateValues at: #content put: pillarDocument execute input outputText.
	
	templatedOutput := (MustacheTemplate on: templateFile readStream contents)
		value: templateValues.
	
	document := PROutputDocument new.
	document pillarDocument: pillarDocument execute input pillarDocument.
	document outputText: templatedOutput.
	
	^ self cacheResult: (PRCompilationContext
		withDocument: document
		withConfiguration: project configuration)