building
writeDocument: aDocument

	| content templateValues templatedOutput outputFile |
	content := self writer write: aDocument.
	
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	templateValues := (self metadataConfigurationForDocument: aDocument) allProperties.
	templateValues at: #content put: content.
	templatedOutput := (MustacheTemplate on: self templateFile readStream contents) value: templateValues.

	outputFile := (self outputDirectory resolve: (file file relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: templatedOutput ].
	^ outputFile