adding
addAbstractOfFile: aFileReference toDocument: aDocument
	| abstractDoc |
	abstractDoc := PRPillarParserMain parse: self currentFile contents.
	"arbitrary value for children"
	abstractDoc setChildren: (abstractDoc children takeFirst: 3).
	^ self availableTemplates
		ifNotEmpty: [ 
			| previousContent |
			previousContent := aDocument text.
			aDocument text: previousContent , (self generateFileUsingTemplateFromDocument: abstractDoc) ]
		ifEmpty: [ 
			aDocument addAll: abstractDoc children.
			self addLinkToDocument: aDocument ]