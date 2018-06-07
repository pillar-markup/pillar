building
getMustacheTemplateValuesFromDocument: aDocument
	| templates content |
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	content := self writer write: aDocument.
	templates := (self metadataConfigurationForDocument: aDocument).
	templates at: #content put: content.
	^ templates