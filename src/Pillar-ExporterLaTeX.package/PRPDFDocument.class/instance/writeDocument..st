writing
writeDocument: aDocument

	| content environment templatedOutput outputFile |
	
	environment := self getMustacheTemplateValuesFromDocument: aDocument.
	content := self writer write: aDocument.
	environment at: #content put: content.

	"so that we can force to have book.bib in the environment"
	"we will have to fix that"
	environment at: #bibFile put: (environment bibFile).
	templatedOutput := (MustacheTemplate on: (self templateFile: aDocument) readStream contents) value: environment.


	self flag: #DuplicatedInSuperclass.
	outputFile := (self outputDirectory resolve: (file file relativeTo: project baseDirectory asAbsolute)) withoutExtension , 'tex'.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | 
		stream nextPutAll: templatedOutput ].
	^ outputFile