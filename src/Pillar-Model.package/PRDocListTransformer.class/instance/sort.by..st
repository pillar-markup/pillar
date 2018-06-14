sorting
sort: aCollectionOfReferences by: aString
	aString = 'date' ifTrue: [ ^ PRDocListDateSorter with: aCollectionOfReferences ].
	aString = 'name' ifTrue: [ ^ PRDocListNameSorter with: aCollectionOfReferences ].
	^ aCollectionOfReferences