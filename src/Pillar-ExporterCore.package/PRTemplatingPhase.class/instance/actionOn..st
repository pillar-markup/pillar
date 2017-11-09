actions
actionOn: aPillarContext
	| writer template templatedOutput document templateValues |
	
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	templateValues := (self metadataConfigurationForDocument: aPillarContext input pillarDocument) allProperties.
	templateValues at: #content put: aPillarContext input outputText.
	
	"Obtain the corresponding mustache template and apply it"
	writer := (aPillarContext configuration propertyAt: #_outputFormat) writerFor: aPillarContext configuration.
	template := writer templateForContext: aPillarContext.
	templatedOutput := (MustacheTemplate on: (aPillarContext configuration baseDirectory / template) readStream contents)
		value: templateValues.
	
	document := PROutputDocument new.
	document pillarDocument: aPillarContext input pillarDocument.
	document outputText: templatedOutput.
	aPillarContext input: document.
	
	^ aPillarContext