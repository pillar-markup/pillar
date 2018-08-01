building
writeDocument: aDocument

	| templateValues templatedOutput outputFile |
	
	templateValues := self getMustacheTemplateValuesFromDocument: aDocument.
	
	templatedOutput := (MustacheTemplate on: self templateFile readStream contents) value: templateValues.
	
	outputFile := (self outputDirectory resolve: (file file relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: templatedOutput ].
	^ outputFile