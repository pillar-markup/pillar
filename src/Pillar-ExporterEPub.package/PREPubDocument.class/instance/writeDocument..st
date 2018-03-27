writing
writeDocument: aDocument
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	| content templateValues templatedOutput outputFile temporaryDirectory navigationContent navigationFile navigationTemplatedOutput |

	outputDirectory := self outputDirectory resolve: (file file parent relativeTo: project baseDirectory asAbsolute).
	temporaryDirectory := outputDirectory / file file withoutExtension basename.

	navigationContent := PREPubNavigationMenuWriter new write: aDocument.
	templateValues := (self metadataConfigurationForDocument: aDocument) allProperties.
	templateValues at: #content put: navigationContent.
	
	navigationTemplatedOutput := (MustacheTemplate on: self navigationTemplateFile readStream contents) value: templateValues.
	navigationFile := temporaryDirectory / 'navigation.xhtml'.	
	navigationFile ensureDelete.
	navigationFile parent ensureCreateDirectory.
	navigationFile writeStreamDo: [ :stream | 
		stream binary.
		(ZnCharacterWriteStream on: stream) nextPutAll: navigationTemplatedOutput ].

	content := self writer write: aDocument.
	templateValues := (self metadataConfigurationForDocument: aDocument) allProperties.
	templateValues at: #content put: content.
	
	templatedOutput := (MustacheTemplate on: self templateFile readStream contents) value: templateValues.
	outputFile := temporaryDirectory / 'contents.xhtml'.	
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | 
		stream binary.
		(ZnCharacterWriteStream on: stream) nextPutAll: templatedOutput ].
	^ outputFile