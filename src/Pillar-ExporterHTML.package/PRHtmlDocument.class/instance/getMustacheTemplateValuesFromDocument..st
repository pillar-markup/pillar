building
getMustacheTemplateValuesFromDocument: aDocument
	"aDocument already has a dictionary holding potential metadata. 
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache."
	
	| template |
	template := super getMustacheTemplateValuesFromDocument: aDocument.
	template 
		at: #toc 
		put: (self tableOfContents asCTEnvironmentWithParent: template).
	^ template