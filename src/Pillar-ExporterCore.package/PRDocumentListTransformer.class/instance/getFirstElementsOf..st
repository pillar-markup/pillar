parsing
getFirstElementsOf: aFileReference
	| doc conf newDoc finalFile |
	"arbitrary value, we have to check for that after"
	doc := PRPillarParser parse: aFileReference contents.
	conf := ConfigurationForPillar newFromDictionary: doc properties.
	conf parent: self configuration.
	newDoc := PRDocument new.
	(doc children first: 3) do: [ :each | newDoc add: each ].
	conf at: #content put: (PRHTMLWriter write: newDoc).
	
	finalFile := (MustacheTemplate on: (self workingDirectory resolve: self defaultTemplateFile) readStream contents ) value: conf.
	
	^ finalFile