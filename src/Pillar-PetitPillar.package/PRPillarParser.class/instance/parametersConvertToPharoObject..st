grammar - Parameter
parametersConvertToPharoObject: aString
"Convert if possible the aString argument into a Pharo object, we also replace nil by true"
"We assume that aString represents only one possible value"

	aString ifNil: [ ^ true ]. 
	"This is for the case where for example we have [[[foo, its value is nil and it should be true"
	^ [(Object readFrom: aString)
			ifNil: [ aString trimBoth ]
		ifNotNil: [ :e | e ]
		] on: OCAbortCompilation, SyntaxErrorNotification	do: [ :e | "PRSyntaxError signal: aString, ' is not a valid value'
			We should decide if we raise an error or not"
			aString ]