parsing
generateFileUsingTemplateFromDocument: aDocument
	| newDoc conf htmlDoc |
	newDoc := PRDocument new.
	"Read configurations"
	conf := ConfigurationForPillar newFromDictionary: aDocument properties.
	conf parent: self configuration.

	"Get a certain number of elements from the original document"
	aDocument properties keysAndValuesDo: [ :key :value | newDoc propertyAt: key put: value ].
	newDoc setChildren: (aDocument children first: 3).
	newDoc
		add:
			((PRInternalLink reference: self filesDirectory , '/' , self currentFile basename)
				addAll: {(PRText content: 'Read more')};
				yourself).

	"Write the  document in HTML, It means that this template is only for HTML generation"
	conf at: #content put: (PRHTMLWriter write: newDoc).
	htmlDoc := (MustacheTemplate on: (self workingDirectory resolve: self availableTemplates first) contents) value: conf.
	availableTemplates := self availableTemplates reverse.
	^ htmlDoc