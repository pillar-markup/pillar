writing
writeDocument: aDocument inFile: aFileReference withWriter: aWriter
	| content templateValues templatedOutput |
	
	content := aWriter write: aDocument.
	templateValues := aDocument properties.
	templateValues at: #content put: content.
	
	templatedOutput := (MustacheTemplate on: self templateFile readStream contents) value: templateValues.
	aFileReference ensureDelete.
	aFileReference parent ensureCreateDirectory.
	aFileReference writeStreamDo: [ :stream | 
		stream nextPutAll: templatedOutput ]