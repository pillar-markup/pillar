visiting
visitEmptyParagraph: anObject
	
	| templateFile |
	templateFile := outputDocument templateDirectory / 'emptyParagraph.mustache'.
	templateFile exists
		ifTrue: [ self halt ]
		ifFalse: [ defaultWriter visitEmptyParagraph: anObject ].