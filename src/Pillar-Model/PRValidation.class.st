Class {
	#name : #PRValidation,
	#superclass : #DynamicVariable,
	#category : 'Pillar-Model-ValidationStrategies'
}

{ #category : #protocol }
PRValidation class >> beSilentDuring: aBlock [
	^ self 
			value: PRValidationStrategy silent
			during: aBlock
]

{ #category : #accessing }
PRValidation class >> defaultStrategy [
	^ PRValidationStrategy shouting
]

{ #category : #accessing }
PRValidation class >> strategy [
	^ PRValidation value ifNil: [ self defaultStrategy ]
]
