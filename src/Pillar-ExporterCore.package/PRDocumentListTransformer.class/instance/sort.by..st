sorting
sort: aCollectionOfReferences by: aString
	aString = 'date' ifTrue: [ ^ PRDocumentListDateSorter with: aCollectionOfReferences ].
	aString = 'name' ifTrue: [ ^ PRDocumentListNameSorter with: aCollectionOfReferences ].
	^ aCollectionOfReferences