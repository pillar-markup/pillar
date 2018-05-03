building
getMustacheTemplateValuesFromDocument: aDocument
	| templates |
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	templates := super getMustacheTemplateValuesFromDocument: aDocument.
	self toc ifNotNil: [ templates at: #toc put: (self toc children collect: [ :each | each asDictionary ]) ].
	^ templates