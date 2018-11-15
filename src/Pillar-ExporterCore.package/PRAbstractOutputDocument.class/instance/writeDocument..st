building
writeDocument: aDocument

	| environment templatedOutput outputFile |
	environment := self getMustacheTemplateValuesFromDocument: aDocument.
	templatedOutput := (MustacheTemplate on: (self templateFile: aDocument) readStream contents) value: environment.
	
	
	self flag: #DuplicatedInSubclass.
	outputFile := (self outputDirectory resolve: (file file relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: templatedOutput ].
	^ outputFile