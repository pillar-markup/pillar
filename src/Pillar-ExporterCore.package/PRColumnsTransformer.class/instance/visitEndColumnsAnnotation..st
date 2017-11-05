visiting-annotations
visitEndColumnsAnnotation: anAnnotation
	currentColumns isNil
		ifTrue: [ PRError signal: 'Column environement ending encounter out of a column environment.' ].
	self replace: {currentColumns}.
	currentColumns := nil.
	currentColumn := nil