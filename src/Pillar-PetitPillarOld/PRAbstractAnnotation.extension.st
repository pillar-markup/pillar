Extension { #name : #PRAbstractAnnotation }

{ #category : #'*Pillar-PetitPillarOld' }
PRAbstractAnnotation class >> adaptKeysOn: aCollection [
	| newDictionary |
	newDictionary := OrderedDictionary new.
	aCollection
		keysDo: [ :key | 
			(aCollection at: key)
				ifNil: [ newDictionary at: self defaultParameterName put: key ]
				ifNotNil: [ :elem | newDictionary at: key put: elem ] ].
	^ newDictionary
]

{ #category : #'*Pillar-PetitPillarOld' }
PRAbstractAnnotation class >> checkKeysOf: aCollection [
	"aCollection may be a SmallDictionary('Foo'->nil 'number'->'5')"

	| nilParameters |
	nilParameters := 0.
	aCollection values do: [ :each | each ifNil: [ nilParameters := nilParameters + 1 ] ].
	self raiseErrorIfTooManyDefaultParameters: nilParameters.
	^ nilParameters = 1
		ifTrue: [ self adaptKeysOn: aCollection ]
		ifFalse: [ aCollection ]
]

{ #category : #'*Pillar-PetitPillarOld' }
PRAbstractAnnotation class >> raiseErrorIfTooManyDefaultParameters: nilParameters [
	nilParameters > 1
		ifTrue: [ PRError signal: 'More than one parameter have no key in ' , self tag , ' annotation.' ]
]

{ #category : #'*Pillar-PetitPillarOld' }
PRAbstractAnnotation class >> withParametersInCollection: aCollection [

	| parameters |
	self flag: 'depricated, used only by the old parser'.
	parameters := self checkKeysOf: aCollection.
	self validateParameters: parameters.
	^ self new
		hadAllKeys: (self possibleParameters difference: (parameters keys collect: #asSymbol)) isEmpty  ;
		parameters: parameters;
		yourself
]
