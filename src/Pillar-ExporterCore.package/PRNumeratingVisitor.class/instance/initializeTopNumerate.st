initialization
initializeTopNumerate
	| cpt |
	cpt := 1.
	[ (configuration printer perform: ('level' , cpt asString) asSymbol) numbering or: [ cpt > 5 ] ] whileFalse: [ cpt := cpt + 1 ].
	topLevelNumerate := cpt