parsing
getFirstElementsOf: aFileReference
	| doc conf newDoc finalFile |
	"arbitrary value, we have to check for that after"
	doc := PRPillarParserMain parse: aFileReference contents.
	conf := ConfigurationForPillar newFromDictionary: doc properties.
	conf parent: self configuration.
	newDoc := PRDocument new.
	doc properties keysAndValuesDo: [ :key :value | newDoc propertyAt: key put: value ].
	(doc children first: 3) collect: [ :each |  newDoc add: each ].
	conf at: #content put: (PRHTMLWriter write: newDoc).

	finalFile := (MustacheTemplate on: (self workingDirectory resolve: self defaultTemplateFile) contents) value: conf.
	
	^ finalFile