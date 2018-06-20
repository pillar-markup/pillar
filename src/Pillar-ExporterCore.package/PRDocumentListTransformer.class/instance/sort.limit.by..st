sorting
sort: aCollectionOfReferences limit: anInteger by: aString
	| references |
	references := aCollectionOfReferences first: anInteger.
	aString = 'date' ifTrue: [ ^ PRDocumentListDateSorter with: references ].
	aString = 'name' ifTrue: [ ^ PRDocumentListNameSorter with: references ].
	^ references