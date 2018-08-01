parsing
generateFileUsingTemplateFromDocument: aDocument
	| conf htmlDoc |
	"Read configurations"
	conf := ConfigurationForPillar newFromDictionary: aDocument properties.
	conf parent: self configuration.
	
	self addLinkToDocument: aDocument.

	"Write the  document in HTML, It means that this template is only for HTML generation"
	conf at: #content put: (PRHTMLWriter write: aDocument).
	htmlDoc := (MustacheTemplate on: (self workingDirectory resolve: self availableTemplates first) contents) value: conf.
	self availableTemplates add: availableTemplates first.
	self availableTemplates remove: availableTemplates first. 
	^ htmlDoc