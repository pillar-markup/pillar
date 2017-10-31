visiting
start: aDocumentItem
	| object |
	object := super start: aDocumentItem.
	currentColumns notNil | currentColumn notNil
		ifTrue: [ PRError
				signal:
					'Missing ending columns annotation. Please use ${endColumns}$ at the end of the columns environment.' ].
	^ object