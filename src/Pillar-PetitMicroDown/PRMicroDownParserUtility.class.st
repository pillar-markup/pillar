Class {
	#name : #PRMicroDownParserUtility,
	#superclass : #Object,
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #'pharo environment' }
PRMicroDownParserUtility class >> convertToPharoObject: aString [
	"Convert if possible the aString argument into a Pharo object.
	We also replace nil by true.
	We assume that aString represents only one possible value"

	| parsed |
	aString ifNil: [ ^ true ]. 
	"This is for the case where for example we have [[[foo, its value is nil and it should be true"
	parsed := (RBParser parseFaultyExpression: aString).

	^ parsed isLiteralNode 	
		ifTrue: [ parsed value]
		ifFalse: [ aString ]
]

{ #category : #parameters }
PRMicroDownParserUtility class >> defaultParameterValue [
	^ true
]

{ #category : #parameters }
PRMicroDownParserUtility class >> fixFirstParameter: aPRParameters for: aPRAnnotation [ 
	"The first parameter can be defined without parameter name.
	In such situation, it is necessary to set properly parameter key and value."
	| aParameter aValue |
	aPRParameters size isZero ifTrue: [ ^ self ].
	aParameter := aPRParameters children first.
	((aPRAnnotation possibleParameters includes: aParameter key) or: [ 
		aParameter value = PRMicroDownParserUtility defaultParameterValue not ]) 
			ifTrue: [ ^ self ].
	aValue := self convertToPharoObject: aParameter keyNode name.
	aParameter valueNode value: aValue.
	aParameter valueNode start: aParameter keyNode start.
	aParameter valueNode stop: aParameter keyNode stop.
	aParameter keyNode name: aPRAnnotation defaultParameterName.
	aParameter keyNode stop: aParameter keyNode start.
]

{ #category : #parameters }
PRMicroDownParserUtility class >> newDefaultParameterValue [
	^ PRParameterValue value: self defaultParameterValue
]
