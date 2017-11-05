visiting-annotations
visitColumnAnnotation: anAnnotation
	currentColumns isNil
		ifTrue: [ PRError
				signal:
					'You can''t create a new column if you are not inside a column environment. Please use ${columns}$ before the beginning of a column.' ].
	currentColumn := PRColumn width: (anAnnotation parameters at: 'width').
	currentColumns add: currentColumn.
	self delete