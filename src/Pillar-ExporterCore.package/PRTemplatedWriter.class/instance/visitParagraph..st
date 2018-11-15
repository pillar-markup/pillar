visiting
visitParagraph: anObject
	
	| templateFile |
	templateFile := outputDocument templateDirectory / 'paragraph.mustache'.
	templateFile exists
		ifTrue: [ self halt ]
		ifFalse: [ defaultWriter writeParagraphDuring: [ self visitDocumentGroup: anObject ] ].