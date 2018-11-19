Extension { #name : #PRAbstractAnnotation }

{ #category : #'*Pillar-PetitPillarOld' }
PRAbstractAnnotation class >> adaptKeysOn: aCollection [
	| newDictionary |
	newDictionary := OrderedDictionary new.
	aCollection
		keysDo: [ :key | 
			(aCollection at: key) isNil
				ifTrue: [ newDictionary at: self defaultParameterName put: key ]
				ifFalse: [ newDictionary at: key put: (aCollection at: key) ] ].
	^ newDictionary
]

{ #category : #'*Pillar-PetitPillarOld' }
PRAbstractAnnotation class >> checkKeysOf: aCollection [
	"aCollection may be a SmallDictionary('Foo'->nil 'number'->'5')"
		
	| nilParameters |
	nilParameters := 0.
	aCollection values
		do: [ :each | 
			each isNil
				ifTrue: [ nilParameters := nilParameters + 1 ] ].
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
