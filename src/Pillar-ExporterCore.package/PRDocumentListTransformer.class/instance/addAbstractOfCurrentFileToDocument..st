adding
addAbstractOfCurrentFileToDocument: aDocument
	| abstractOfCurrentFile |
	abstractOfCurrentFile := PRPillarParserMain parse: self currentFile contents.
	"arbitrary value for children"
	abstractOfCurrentFile setChildren: (abstractOfCurrentFile children takeFirst: 3).
	^ self availableTemplates
		ifNotEmpty: [ 
			| previousContent |
			previousContent := aDocument text.
			aDocument text: previousContent , (self generateFileUsingTemplateFromDocument: abstractOfCurrentFile) ]
		ifEmpty: [ 
			aDocument addAll: abstractOfCurrentFile children.
			self addLinkToDocument: aDocument ]