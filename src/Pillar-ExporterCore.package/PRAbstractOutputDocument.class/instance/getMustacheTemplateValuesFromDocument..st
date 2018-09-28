building
getMustacheTemplateValuesFromDocument: aDocument
	"aDocument already has a dictionary holding potential metadata. 
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache."
	| templates content |
	content := self writer write: aDocument.
	" templates := (self metadataConfigurationForDocument: aDocument)."

	templates := aDocument properties "allProperties".
	templates at: #content put: content.
	^ templates