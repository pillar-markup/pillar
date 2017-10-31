visiting-document
visitPreformatted: anObject
	anObject children do: [ :each | self visit: each. canvas newLine ]