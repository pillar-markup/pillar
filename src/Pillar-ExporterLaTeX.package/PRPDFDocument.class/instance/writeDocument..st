writing
writeDocument: aDocument

	| content templateValues templatedOutput outputFile |
	content := self writer write: aDocument.
	templateValues := aDocument properties allProperties.
	templateValues at: #content put: content.
	
	templatedOutput := (MustacheTemplate on: (self templateFile: aDocument) readStream contents) value: templateValues.

	outputFile := (self outputDirectory resolve: (file file relativeTo: project baseDirectory asAbsolute)) withoutExtension , 'tex'.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | 
		stream nextPutAll: templatedOutput ].
	^ outputFile