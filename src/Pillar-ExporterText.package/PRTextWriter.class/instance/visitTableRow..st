visiting-document
visitTableRow: anObject
	anObject children
		do: [ :each | self visit: each ]
		separatedBy: [ canvas tab ].
	canvas newLine