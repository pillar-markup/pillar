visiting
visitFigure: aFigure
	
	| templateFile |
	templateFile := outputDocument templateDirectory / 'figure.mustache'.
	templateFile exists
		ifTrue: [ | result |	
			result := templateFile asMustacheTemplate value: {
				'ref' -> aFigure localFileOrExternalReference.
				'caption' -> (aFigure hasChildren ifTrue: [ aFigure text ] ifFalse: [ '' ]) } asDictionary.
			self visitRaw: (PRRaw content: result type: defaultWriter writerName) ]
		ifFalse: [ defaultWriter visitFigure: aFigure ].