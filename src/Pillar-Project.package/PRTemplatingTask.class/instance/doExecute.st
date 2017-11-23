execution
doExecute
	| templateValues templatedOutput document |
		
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	templateValues := (self metadataConfigurationForDocument: self formattedDocument pillarDocument) allProperties.
	templateValues at: #content put: self formattedDocument outputText.
	
	templatedOutput := (MustacheTemplate on: self templateFile readStream contents)
		value: templateValues.
	
	document := PROutputDocument new.
	document pillarDocument: self formattedDocument pillarDocument.
	document outputText: templatedOutput.
	
	^ document