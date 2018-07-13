parsing
getFirstElementsOf: aFileReference
	| doc conf finalFile |
	"arbitrary value, we have to check for that after"
	doc := PRPillarParserMain parse: aFileReference contents.
	conf := ConfigurationForPillar newFromDictionary: doc properties.
	conf parent: self configuration.
	
	(self hasTemplateAt: (self workingDirectory resolve: self defaultTemplateFile))
	ifTrue: [ 
		| newDoc |
		newDoc := PRDocument new.
		doc properties keysAndValuesDo: [ :key :value | newDoc propertyAt: key put: value ].
		(doc children first: 3) collect: [ :each |  newDoc add: each ].
		newDoc add: ((PRInternalLink reference: (self directoryName , '/', aFileReference basename)) addAll: {(PRText content: 'Read more')}; yourself).
		
		conf at: #content put: (PRHTMLWriter write: newDoc).
		finalFile := (MustacheTemplate on: (self workingDirectory resolve: self defaultTemplateFile) contents) value: conf.
 			
		]
	ifFalse: [ 
		finalFile := doc children first: 3.
		].
	
	^ finalFile