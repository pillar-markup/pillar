metadata
getMustacheTemplateValuesFromDocument: aDocument
	"aDocument already has a conifguration holding potential metadata. 
	We add the text contents to it. This dictionarylike structure will be used by the mustache."

	| templates content |
	content := self writer write: aDocument.
	templates := aDocument properties.
	templates at: #content put: content.
	^ templates