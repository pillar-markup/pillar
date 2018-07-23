parsing
getFirstElements
	| doc finalFile |
	doc := PRPillarParserMain parse: self currentFile contents.
	
	self availableTemplates
	ifNotEmpty: [ 
		finalFile := self generateFileUsingTemplateFromDocument: doc
		]
	ifEmpty: [ 
		finalFile := doc children first: 3.
		"finalFile
		add:
			((PRInternalLink reference: (self directoryName , '/', self currentFile basename))
				addAll: {(PRText content: 'Read more')};
				yourself)"
		].
	
	^ finalFile