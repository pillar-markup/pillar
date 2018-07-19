parsing
generateFileUsingTemplateFromDocument: aDocument
		| newDoc conf |
		
		newDoc := PRDocument new.
		"Read configurations"
		conf := ConfigurationForPillar newFromDictionary: aDocument properties.
		conf parent: self configuration.

	   "Get some elements of the original document"
		aDocument properties keysAndValuesDo: [ :key :value | newDoc propertyAt: key put: value ].
		(aDocument children first: 3) collect: [ :each |  newDoc add: each ].
		newDoc add: ((PRInternalLink reference: (self directoryName , '/', self currentFile basename)) addAll: {(PRText content: 'Read more')}; yourself).
		
		"Write the  document in HTML, It means that this template is only for HTML generation"
		conf at: #content put: (PRHTMLWriter write: newDoc).
		^ (MustacheTemplate on: (self workingDirectory resolve: self defaultTemplateFile) contents) value: conf