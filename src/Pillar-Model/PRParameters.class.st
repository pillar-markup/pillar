Class {
	#name : #PRParameters,
	#superclass : #PRDocumentGroup,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRParameters class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
PRParameters class >> with: aPRParameter withAll: aCollection [ 
	| anInstance |
	anInstance := self new.
	aPRParameter ifNotNil: [ anInstance add: aPRParameter ].
	aCollection ifNotNil: [ anInstance addAll: aCollection ].
	^ anInstance
]

{ #category : #visitor }
PRParameters >> accept: aVisitor [
	^ aVisitor visitParameters: self
]
