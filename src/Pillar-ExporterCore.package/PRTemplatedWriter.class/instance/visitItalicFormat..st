visiting
visitItalicFormat: aPRItalicFormat 
	
	| templateFile |
	templateFile := outputDocument templateDirectory / 'italic.mustache'.
	templateFile exists
		ifTrue: [ self halt ]
		ifFalse: [ defaultWriter visitItalicFormat: aPRItalicFormat ].