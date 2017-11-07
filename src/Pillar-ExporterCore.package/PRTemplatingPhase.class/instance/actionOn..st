actions
actionOn: aPillarContext
	| writer metadata template templatedOutput document |
	writer := aPillarContext configuration outputType new.
	metadata := self metadataConfigurationForDocument: aPillarContext input pillarDocument.
	template := self templateForFile: self configuration inputFile usingWriter: writer.
	templatedOutput := (MustacheTemplate
		on: (aPillarContext configuration baseDirectory / template) readStream contents)
		value:
			{('title' -> (metadata propertyAt: 'title')).
			('attribution' -> (metadata propertyAt: 'attribution')).
			('content' -> aPillarContext input outputText)} asDictionary.
	document := PROutputDocument new.
	document pillarDocument: aPillarContext input pillarDocument.
	document outputText: templatedOutput.
	aPillarContext input: document.
	^ aPillarContext