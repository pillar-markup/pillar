writing
writeDocument: aDocument inFile: aFileReference withWriter: aWriter
	| content templateValues templatedOutput |
	
	content := aWriter write: aDocument.
	
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	templateValues := (self metadataConfigurationForDocument: aDocument) allProperties.
	templateValues at: #content put: content.
	
	templatedOutput := (MustacheTemplate on: self templateFile readStream contents) value: templateValues.
	aFileReference ensureDelete.
	aFileReference parent ensureCreateDirectory.
	aFileReference writeStreamDo: [ :stream | 
		stream binary.
		(ZnCharacterWriteStream on: stream) nextPutAll: templatedOutput ]