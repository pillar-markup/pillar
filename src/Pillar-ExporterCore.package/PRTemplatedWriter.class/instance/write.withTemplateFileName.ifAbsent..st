writing
write: aDocumentItem withTemplateFileName: templateFileName ifAbsent: aBlock

	self
		write: aDocumentItem
		withTemplateFileName: templateFileName
		extraArguments: #()
		ifAbsent: aBlock