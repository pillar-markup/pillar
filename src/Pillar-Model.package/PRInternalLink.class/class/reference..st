instance creation
reference: aString
	| index |
	^ (index := aString indexOf: $@) isZero
		ifTrue: [ super reference: aString ]
		ifFalse: [ 
			index = 1
				ifTrue: [ self new anchor: (aString copyFrom: index + 1 to: aString size) ]
				ifFalse: [ 
					self new
						reference: (aString copyFrom: 1 to: index - 1);
						anchor: (aString copyFrom: index + 1 to: aString size);
						yourself ] ]