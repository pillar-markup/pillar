testing
isValidReference: aString
	| index |
	index := aString indexOf: $@ ifAbsent: [ ^ false ].
	index := aString indexOf: $. startingAt: index ifAbsent: [ ^ false ].
	^ aString allSatisfy: [ :each | each isAlphaNumeric or: [ '@-.' includes: each ] ]