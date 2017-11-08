visiting-document
visitListItem: aListItem
	"http://spec.commonmark.org/0.28/#list-items and http://spec.commonmark.org/0.28/#lists"

	nesting last isInteger ifTrue: [ nesting addLast: nesting removeLast + 1 ].
	nesting size - 1 timesRepeat: [ canvas raw: '  ' ].
	canvas nextPutAll: nesting last greaseString.
	canvas nextPutAll: (nesting last isInteger 
			ifTrue: [ '. ' ]
			ifFalse: [ ' ' ]).
	self visitDocumentGroup: aListItem.
	canvas potentialNewLine