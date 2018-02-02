accessing
copyFile: aReference
	| copy |
	copy := dest resolve: (aReference relativeTo: source).
	copy exists ifTrue: [ 
		^ conflictResolutionBlock value: aReference value: copy ].
	aReference copyTo: copy