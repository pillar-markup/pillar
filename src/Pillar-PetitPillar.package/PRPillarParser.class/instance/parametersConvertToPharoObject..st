grammar - Parameter
parametersConvertToPharoObject: aString
	"Convert if possible the aString argument into a Pharo object, we also replace nil by true"
	"We assume that aString represents only one possible value"

	| parsed |
	aString ifNil: [ ^ true ]. 
	"This is for the case where for example we have [[[foo, its value is nil and it should be true"
	parsed := (RBParser parseFaultyExpression: aString).
	^ parsed isLiteral 	
		ifTrue: [ parsed value ]
		ifFalse: [ parsed  ]

	"^ [(Object readFrom: aString)
			ifNil: [ aString trimBoth ]
		ifNotNil: [ :e | e ]
		] on: Exception  do: [ :e | PRSyntaxError signal: aString, ' is not a valid value'
			aString ]"