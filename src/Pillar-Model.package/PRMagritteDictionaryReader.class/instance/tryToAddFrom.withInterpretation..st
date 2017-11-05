visiting-description
tryToAddFrom: aDescription withInterpretation: aBlock
	"I take a Description, check if an object of the dictionary match with the description, if I find one, I interpret it and add it to the new dictionary."

	| accessor value |
	accessor := aDescription accessor selector.
	((dictionary includesKey: accessor) not and: [ aDescription default isNil ])
		ifTrue: [ ^ self checkRequired: accessor with: aDescription].

	value := dictionary at: accessor
		ifPresent: aBlock
		ifAbsent: [ aDescription default ].
	
	aDescription validate: value.
	annotationDictionary at: accessor put: value.
	dictionary removeKey: accessor ifAbsent: [  ].