visiting
start: aDocumentItem
	| object |
	
	"Execute clean annotation before"
	PRCleanAnnotationInParagraphTransfomer new
		start: aDocumentItem.
	
	object := super start: aDocumentItem.
	currentColumns notNil | currentColumn notNil
		ifTrue: [ PRError
				signal:
					'Missing ending columns annotation. Please use ${endColumns}$ at the end of the columns environment.' ].
	^ object