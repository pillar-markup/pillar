rendering-element
renderElement: aNumber
	| alphabet position |
	aNumber = 0 ifTrue: [ ^ 'NaN' ].
	
	alphabet := Character alphabet.
	position := aNumber \\ alphabet size.
	position = 0 ifTrue: [ position := alphabet size ].
	
	^ String
		streamContents: [ :s | 
			s nextPut: (alphabet at: position) asUppercase.
			((aNumber - 1) / alphabet size) asFloat floor
				timesRepeat: [ s nextPut: $' ] ]