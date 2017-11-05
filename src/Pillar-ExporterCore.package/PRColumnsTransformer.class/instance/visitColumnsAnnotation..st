visiting-annotations
visitColumnsAnnotation: anAnnotation
	currentColumns notNil
		ifTrue: [ PRError
				signal:
					'You have to close a columns environment before you open an other. Use the ${endColumns}$ tag please.' ].
	currentColumns := PRColumns new.
	self delete