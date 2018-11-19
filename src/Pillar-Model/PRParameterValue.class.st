Class {
	#name : #PRParameterValue,
	#superclass : #PRDocumentItem,
	#instVars : [
		'value'
	],
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRParameterValue class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
PRParameterValue class >> value: aString [ 
	^ self new value: aString
]

{ #category : #comparing }
PRParameterValue >> = anObject [
	^ super = anObject and: [ 
		self value = anObject value ]
]

{ #category : #visitor }
PRParameterValue >> accept: aVisitor [
	^ aVisitor visitParameterValue: self
]

{ #category : #comparing }
PRParameterValue >> hash [
	^ super hash bitXor: self value hash
]

{ #category : #accessing }
PRParameterValue >> value [
	^ value
]

{ #category : #accessing }
PRParameterValue >> value: anObject [
	value := anObject
]
