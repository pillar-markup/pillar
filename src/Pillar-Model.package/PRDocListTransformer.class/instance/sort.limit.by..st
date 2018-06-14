sorting
sort: aCollectionOfReferences limit: anInteger by: aString
	| references |
	references := aCollectionOfReferences first: anInteger.
	aString = 'date' ifTrue: [ ^ PRDocListDateSorter with: references ].
	aString = 'name' ifTrue: [ ^ PRDocListNameSorter with: references ].
	^ references