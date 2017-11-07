actions
actionOn: aPillarContext
	| writer metadata template templatedOutput document |
	writer := aPillarContext configuration outputType new.
	metadata := self metadataConfigurationForDocument: aPillarContext input pillarDocument.
	template := writer templateForContext: aPillarContext.
	templatedOutput := (MustacheTemplate on: (aPillarContext configuration baseDirectory / template) readStream contents)
		value:
			{('title' -> (metadata propertyAt: 'title')).
			('attribution' -> (metadata propertyAt: 'attribution')).
			('author' -> (metadata propertyAt: 'author')).
			('content' -> aPillarContext input outputText)} asDictionary.
	document := PROutputDocument new.
	document pillarDocument: aPillarContext input pillarDocument.
	document outputText: templatedOutput.
	aPillarContext input: document.
	^ aPillarContext