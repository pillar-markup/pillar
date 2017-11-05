accessing
fileLineNumber
	| tmpStream cpt |
	tmpStream := fileStream copy.
	cpt := 0.
	[ tmpStream nextLine isNotNil ] whileTrue: [ cpt := cpt + 1 ].
	^ cpt