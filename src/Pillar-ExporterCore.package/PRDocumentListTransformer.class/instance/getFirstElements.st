parsing
getFirstElements
	| doc finalFile |
	doc := PRPillarParserMain parse: self currentFile contents.
	
	(self hasTemplateAt: (self workingDirectory resolve: self defaultTemplateFile))
	ifTrue: [ 
		finalFile := self generateFileUsingTemplateFromDocument: doc
		]
	ifFalse: [ 
		finalFile := doc children first: 3.
		"finalFile
		add:
			((PRInternalLink reference: (self directoryName , '/', self currentFile basename))
				addAll: {(PRText content: 'Read more')};
				yourself)"
		].
	
	^ finalFile