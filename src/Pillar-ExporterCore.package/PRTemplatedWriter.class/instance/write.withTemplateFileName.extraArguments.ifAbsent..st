writing
write: aDocumentItem withTemplateFileName: templateFileName extraArguments: arguments ifAbsent: aBlock

	self
		writeRawText: [ | subWriter |
			subWriter := outputDocument writer.
			subWriter visitDocumentGroup: aDocumentItem.
			subWriter contents ]
		withTemplateFileName: templateFileName
		extraArguments: arguments
		ifAbsent: aBlock