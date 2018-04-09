visiting-document
visitListItem: anObject

	nesting last isInteger ifTrue: [ nesting addLast: nesting removeLast + 1 ].
	nesting size - 1 timesRepeat: [ canvas tab ].
	canvas nextPutAll: nesting last asString.
	canvas nextPutAll: (nesting last isInteger 
			ifTrue: [ '. ' ]
			ifFalse: [ ' ' ]).
	super visitListItem: anObject.
	canvas potentialNewLine