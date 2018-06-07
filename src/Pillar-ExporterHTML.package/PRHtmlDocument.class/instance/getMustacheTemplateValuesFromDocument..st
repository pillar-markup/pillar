building
getMustacheTemplateValuesFromDocument: aDocument
	| template |
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	template := super getMustacheTemplateValuesFromDocument: aDocument.
	template at: #toc put: (self tableOfContents asCTEnvironmentWithParent: template).
	^ template