"
I am a Mock to test the annotations.
"
Class {
	#name : #PRMockAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #'instance creation' }
PRMockAnnotation class >> possibleParameters [

	^ #(value number)
]

{ #category : #protected }
PRMockAnnotation class >> tag [
	^ #mock
]

{ #category : #'instance creation' }
PRMockAnnotation class >> validateParameters: parameters [

	super validateParameters: parameters.
	parameters
		at: 'number'
		ifPresent: [ :v | parameters at: 'number' put: v asNumber ]
	
]

{ #category : #printing }
PRMockAnnotation >> asPillarParametersOn: aStream [
	self parameters keys
		do: [ :each | self asPillarKey: each value:  (self parameters at: each) asString on: aStream ]
		separatedBy: [ aStream nextPut: self class parameterSeparator ]
]
