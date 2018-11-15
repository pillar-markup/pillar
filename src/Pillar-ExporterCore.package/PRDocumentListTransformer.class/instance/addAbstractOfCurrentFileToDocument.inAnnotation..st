adding
addAbstractOfCurrentFileToDocument: aDocument inAnnotation: aPRDocListAnnotation
	| abstractOfCurrentFile |
	abstractOfCurrentFile := PRPillarParserMain parse: self currentFile contents.
	"arbitrary value for children"
	abstractOfCurrentFile
		setChildren: {(PRText content: (abstractOfCurrentFile text truncateWithElipsisTo: aPRDocListAnnotation summaryMaxSize))}.
	^ self availableTemplates
		ifNotEmpty: [ | previousContent |
			previousContent := aDocument text.
			aDocument
				text: previousContent , (self generateFileUsingTemplateFromDocument: abstractOfCurrentFile) ]
		ifEmpty: [ aDocument addAll: abstractOfCurrentFile children.
			self addLinkToDocument: aDocument ]