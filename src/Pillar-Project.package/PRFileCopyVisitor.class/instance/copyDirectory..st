accessing
copyDirectory: aReference
	| copy |
	copy := dest resolve: (aReference relativeTo: source).
	copy exists ifTrue: [ 
		^ conflictResolutionBlock value: aReference value: copy ].
	copy createDirectory