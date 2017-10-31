visiting-document
visitListItem: aListItem
	nesting last isInteger ifTrue: [ nesting addLast: nesting removeLast + 1 ].
	nesting size - 1 timesRepeat: [ canvas raw: '  ' ].
	canvas nextPutAll: nesting last greaseString.
	canvas nextPutAll: (nesting last isInteger 
			ifTrue: [ '. ' ]
			ifFalse: [ ' ' ]).
	self visitDocumentGroup: aListItem.
	canvas potentialNewLine