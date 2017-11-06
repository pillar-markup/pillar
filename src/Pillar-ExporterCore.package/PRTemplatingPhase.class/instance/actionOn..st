actions
actionOn: aPillarContext
	| writer content metadata template |
	writer := aPillarContext configuration outputType new.

	content := writer write: aPillarContext input.
	metadata := self metadataConfigurationForDocument: aPillarContext input.
	template := self templateForFile: self configuration inputFile usingWriter: writer.
	
	^ (MustacheTemplate on: (aPillarContext configuration baseDirectory / template) readStream contents)
		value:
			{('title' -> (metadata propertyAt: 'title')). 
			('attribution' -> (metadata propertyAt: 'attribution')).
			('content' -> content)} asDictionary